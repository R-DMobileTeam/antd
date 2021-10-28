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
            if (methodName == 'onClick') {
              final index = (arguments as Map)['index'];
              if (index is int) {
                children[index].onClick?.call();
              }
            }
          },
        );
      },
    );
  }
}

class BreadcrumbItem {
  final String? text;
  final String? href;
  final String? target;
  final Function? onClick;

  BreadcrumbItem({
    this.text,
    this.href,
    this.target,
    this.onClick,
  });

  Map toJson() {
    return {
      'text': text,
      'href': href,
      'target': target,
    }..removeWhere((key, value) => value == null);
  }
}
