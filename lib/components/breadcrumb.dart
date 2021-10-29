import 'package:antd/plugin.dart';
import 'package:flutter/widgets.dart';
import 'package:mpcore/mpcore.dart';

class Breadcrumb extends StatelessWidget {
  final List<BreadcrumbItem> children;
  final String? separator;

  Breadcrumb({
    required this.children,
    this.separator,
  });

  @override
  Widget build(BuildContext context) {
    return MPPlatformViewWithIntrinsicContentSize(
      builder: (context) {
        return MPPlatformView(
          viewType: 'design.ant.breadcrumb',
          viewAttributes: {
            'children': children,
            'separator': separator,
          }..removeWhere((key, value) => value == null),
          onMethodCall: (methodName, arguments) {
            AntLink.handleMethodCall(methodName, arguments, children);
          },
        );
      },
    );
  }
}

class BreadcrumbItem extends AntInnerComponent {
  final List<AntComponent>? children;
  final bool? linkStyle;

  BreadcrumbItem({
    String? text,
    AntIcon? icon,
    List<AntComponent>? children,
    this.linkStyle = false,
  })  : this.children = (() {
          if (children != null) return children;
          if (text != null && icon != null) return [icon, AntText(text: text)];
          if (text != null) return [AntText(text: text)];
          if (icon != null) return [icon];
        })(),
        super(
          componentName: 'antd.Breadcrumb.Item',
          attributes: {
            "href": linkStyle == true ? "javascript: void(0);" : null
          },
          children: children,
        );
}
