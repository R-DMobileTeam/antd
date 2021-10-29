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

  MenuItem({
    String? text,
    AntIcon? icon,
    List<AntComponent>? children,
  })  : this.children = (() {
          if (children != null) return children;
          if (text != null && icon != null) return [icon, AntText(text: text)];
          if (text != null) return [AntText(text: text)];
          if (icon != null) return [icon];
        })(),
        super(
          componentName: 'antd.Menu.Item',
          attributes: {},
          children: children,
        );
}
