import 'package:flutter/widgets.dart';
import 'package:mpcore/mpcore.dart';

enum DividerOrientation { left, right, center }
enum DividerType { horizontal, vertical }

class Divider extends StatelessWidget {
  final String? text;
  final bool? dashed;
  final DividerOrientation? orientation;
  final bool? plain;
  final DividerType? type;

  Divider({
    this.text,
    this.dashed,
    this.orientation,
    this.plain,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    Widget child = MPPlatformView(
      viewType: 'design.ant.divider',
      viewAttributes: {
        'text': text,
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
