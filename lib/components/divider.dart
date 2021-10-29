import 'package:flutter/widgets.dart';
import 'package:mpcore/mpcore.dart';

import 'react_component.dart';

enum DividerOrientation { left, right, center }
enum DividerType { horizontal, vertical }

class Divider extends StatelessWidget {
  final List<AntComponent>? children;
  final bool? dashed;
  final DividerOrientation? orientation;
  final bool? plain;
  final DividerType? type;

  Divider({
    String? text,
    AntIcon? icon,
    List<AntComponent>? children,
    this.dashed,
    this.orientation,
    this.plain,
    this.type,
  }) : this.children = (() {
          if (children != null) return children;
          if (text != null && icon != null) return [icon, AntText(text: text)];
          if (text != null) return [AntText(text: text)];
          if (icon != null) return [icon];
        })();

  @override
  Widget build(BuildContext context) {
    Widget child = MPPlatformView(
      viewType: 'design.ant.divider',
      viewAttributes: {
        'children': children,
        'dashed': dashed,
        'orientation': (() {
          switch (orientation) {
            case DividerOrientation.center:
              return 'center';
            case DividerOrientation.left:
              return 'left';
            case DividerOrientation.right:
              return 'right';
            default:
              return 'center';
          }
        })(),
        'plain': plain,
        'type': (() {
          switch (type) {
            case DividerType.horizontal:
              return 'horizontal';
            case DividerType.vertical:
              return 'vertical';
            default:
              return 'horizontal';
          }
        })(),
      }..removeWhere((key, value) => value == null),
      onMethodCall: (methodName, arguments) {
        if (children != null) {
          AntLink.handleMethodCall(methodName, arguments, children!);
        }
      },
    );
    switch (type) {
      case DividerType.horizontal:
        {
          child = Container(height: 50, child: child);
          break;
        }
      case DividerType.vertical:
        {
          child = Container(width: 16, height: 20, child: child);
          break;
        }
      default:
        {
          child = Container(height: 50, child: child);
          break;
        }
    }
    return child;
  }
}
