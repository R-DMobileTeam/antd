abstract class AntComponent {}

class AntText extends AntComponent {
  final String text;
  AntText({required this.text});

  Map toJson() {
    return {
      'type': 'text',
      'text': text,
    };
  }
}

class AntIcon extends AntComponent {
  final String data;
  AntIcon({required this.data});

  Map toJson() {
    return {
      'type': 'icon',
      'data': data,
    };
  }
}

class AntLink extends AntComponent {
  final List<AntComponent>? children;
  final bool? highlighted;
  final String? href;
  final String? target;
  final Function? onClick;

  AntLink({
    String? text,
    AntIcon? icon,
    List<AntComponent>? children,
    this.highlighted,
    this.href,
    this.target,
    this.onClick,
  }) : this.children = (() {
          if (children != null) return children;
          if (text != null && icon != null) return [icon, AntText(text: text)];
          if (text != null) return [AntText(text: text)];
          if (icon != null) return [icon];
        })();

  static void handleMethodCall(
    String methodName,
    dynamic arguments,
    List<AntComponent> children,
  ) {
    if (methodName == 'onClick' &&
        arguments is Map &&
        arguments['target'] != null) {
      final target = findChild(arguments['target'], children);
      if (target != null && target is AntLink) {
        target.onClick?.call();
      }
    }
  }

  static AntComponent? findChild(int target, List<AntComponent> children) {
    AntComponent? result;
    for (var item in children) {
      if (item.hashCode == target) {
        result = item;
        break;
      } else if (item is AntInnerComponent && item.children != null) {
        var subResult = findChild(target, item.children!);
        if (subResult != null) {
          result = subResult;
          break;
        }
      } else if (item is AntLink && item.children != null) {
        var subResult = findChild(target, item.children!);
        if (subResult != null) {
          result = subResult;
          break;
        }
      }
    }
    return result;
  }

  Map toJson() {
    return {
      'type': 'link',
      'children': children,
      'highlighted': highlighted,
      'href': href,
      'target': target,
      'onClick': onClick != null ? hashCode : null,
    };
  }
}

class AntInnerComponent extends AntComponent {
  final String componentName;
  final Map? attributes;
  final List<AntComponent>? children;

  AntInnerComponent({
    required this.componentName,
    this.attributes,
    this.children,
  });

  Map toJson() {
    return {
      'type': 'innerComponent',
      'componentName': componentName,
      'attributes': attributes?..removeWhere((key, value) => value == null),
      'children': children,
    };
  }
}
