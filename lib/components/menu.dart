import 'react_component.dart';

class Menu extends AntInnerComponent {
  final List<MenuItem> children;

  Menu({
    required this.children,
  }) : super(
          componentName: 'antd.Menu',
          attributes: {},
          children: children,
        );
}

class MenuItem extends AntInnerComponent {
  final List<AntComponent>? children;
  final bool? danger;
  final bool? disabled;
  final String? title;
  final Function? onClick;

  MenuItem({
    String? text,
    AntIcon? icon,
    this.danger,
    this.disabled,
    this.title,
    this.onClick,
    List<AntComponent>? children,
  })  : this.children = (() {
          if (children != null) return children;
          if (text != null && icon != null) return [icon, AntText(text: text)];
          if (text != null) return [AntText(text: text)];
          if (icon != null) return [icon];
        })(),
        super(
          componentName: 'antd.Menu.Item',
          attributes: {
            'danger': danger,
            'disabled': disabled,
            'title': title,
          }..removeWhere((key, value) => value == null),
          children: children,
        );

  @override
  Map extraAttributes() {
    return super.extraAttributes()
      ..addAll({
        'onClick': onClick != null ? hashCode : null,
      });
  }
}
