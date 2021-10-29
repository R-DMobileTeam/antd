import 'package:flutter/widgets.dart';
import 'package:mpcore/mpcore.dart';

import 'react_component.dart';

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
  final List<AntComponent>? children;
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

  Button({
    String? text,
    AntIcon? icon,
    List<AntComponent>? children,
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
  }) : this.children = (() {
          if (children != null) return children;
          if (text != null && icon != null) return [icon, AntText(text: text)];
          if (text != null) return [AntText(text: text)];
          if (icon != null) return [icon];
        })();

  @override
  Widget build(BuildContext context) {
    return MPPlatformViewWithIntrinsicContentSize(
      builder: (context) => MPPlatformView(
        viewType: 'design.ant.button',
        viewAttributes: {
          'children': children,
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
