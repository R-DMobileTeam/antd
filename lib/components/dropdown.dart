import 'package:antd/components/menu.dart';
import 'package:flutter/widgets.dart';
import 'package:mpcore/mpcore.dart';

import 'react_component.dart';

class Dropdown extends StatelessWidget {
  final Menu overlay;
  final AntComponent child;

  Dropdown({
    required this.overlay,
    String? text,
    AntIcon? icon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MPPlatformViewWithIntrinsicContentSize(
      builder: (context) {
        return MPPlatformView(
          viewType: 'design.ant.dropdown',
          viewAttributes: {
            'overlay': overlay,
            'children': [child],
          }..removeWhere((key, value) => value == null),
          onMethodCall: (methodName, arguments) {
            AntLink.handleMethodCall(methodName, arguments, [child]);
          },
        );
      },
    );
  }
}
