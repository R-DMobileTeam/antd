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
    return MPPlatformViewWithIntrinsicContentSize(
      builder: (context) => MPPlatformView(
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
                return '';
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
                return '';
            }
          })(),
        }..removeWhere((key, value) => value == null),
      ),
    );
  }
}
