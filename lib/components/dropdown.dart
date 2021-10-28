import 'package:antd/components/menu.dart';
import 'package:flutter/widgets.dart';
import 'package:mpcore/mpcore.dart';

class Dropdown extends StatelessWidget {
  final Menu overlay;
  final Widget? child;
  final String? text;
  final String? icon;

  Dropdown({
    required this.overlay,
    this.child,
    this.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return MPPlatformViewWithIntrinsicContentSize(
      builder: (context) {
        return MPPlatformView(
          viewType: 'design.ant.dropdown',
          viewAttributes: {
            'overlay': overlay,
            'text': text,
            'icon': icon,
          }..removeWhere((key, value) => value == null),
          // child: child,
          onMethodCall: (methodName, arguments) {
            // if (methodName == 'onClick') {
            //   final index = (arguments as Map)['index'];
            //   if (index is int) {
            //     children[index].onClick?.call();
            //   }
            // }
          },
        );
      },
    );
  }
}
