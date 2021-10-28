import 'package:flutter/widgets.dart';
import 'package:mpcore/mpcore.dart';

enum ButtonType {
  primary,
  dashed,
  text,
  link,
}

enum ButtonSize {
  large,
  small,
}

enum ButtonShape {
  circle,
  round,
}

class Button extends StatelessWidget {
  final String? text;
  final ButtonType? type;
  final ButtonSize? size;
  final ButtonShape? shape;
  final bool? loading;
  final bool? ghost;
  final bool? danger;
  final bool? block;
  final bool? disabled;
  final Function? onClick;
  final String? href;
  final String? target;
  final String? icon;

  Button({
    this.text,
    this.type,
    this.size,
    this.shape,
    this.loading,
    this.ghost,
    this.danger,
    this.block,
    this.disabled,
    this.onClick,
    this.href,
    this.target,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return MPPlatformViewWithIntrinsicContentSize(
      builder: (context) => MPPlatformView(
        viewType: 'design.ant.button',
        viewAttributes: {
          'text': text,
          'type': (() {
            switch (this.type) {
              case ButtonType.primary:
                return 'primary';
              case ButtonType.dashed:
                return 'dashed';
              case ButtonType.text:
                return 'text';
              case ButtonType.link:
                return 'link';
              default:
                return '';
            }
          })(),
          'size': (() {
            switch (this.size) {
              case ButtonSize.small:
                return 'small';
              case ButtonSize.large:
                return 'large';
              default:
                return '';
            }
          })(),
          'shape': (() {
            switch (this.shape) {
              case ButtonShape.circle:
                return 'circle';
              case ButtonShape.round:
                return 'round';
              default:
                return '';
            }
          })(),
          'loading': loading,
          'ghost': ghost,
          'danger': danger,
          'block': block,
          'disabled': disabled,
          'href': href,
          'target': target,
          'icon': icon,
        }..removeWhere((key, value) => value == null),
        onMethodCall: (methodName, arguments) {
          if (methodName == 'onClick') {
            onClick?.call();
          }
        },
      ),
    );
  }
}
