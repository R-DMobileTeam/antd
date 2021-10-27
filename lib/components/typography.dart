import 'package:flutter/widgets.dart';
import 'package:mpcore/mpcore.dart';

enum TypographyType { secondary, success, warning, danger }

class TypographyEditable {
  final int? maxLength;
  final bool? autoSize;
  final Function()? onStart;
  final Function(String)? onChange;
  final Function()? onCancel;
  final Function()? onEnd;

  TypographyEditable({
    this.maxLength,
    this.autoSize,
    this.onStart,
    this.onChange,
    this.onCancel,
    this.onEnd,
  });

  Map toJson() {
    return {
      'maxLength': maxLength,
      'autoSize': autoSize,
    }..removeWhere((key, value) => value == null);
  }
}

class TypographyTitle extends StatelessWidget {
  final String? text;
  final bool? code;
  final bool? copyable;
  final bool? delete;
  final bool? disabled;
  final TypographyEditable? editable;
  final bool? ellipsis;
  final int level;
  final bool? mark;
  final bool? italic;
  final TypographyType? type;
  final bool? underline;
  final Function? onClick;

  TypographyTitle({
    this.text,
    this.code,
    this.copyable,
    this.delete,
    this.disabled,
    this.editable,
    this.ellipsis,
    this.level = 1,
    this.mark,
    this.italic,
    this.type,
    this.underline,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return MPPlatformViewWithIntrinsicContentSize(
      builder: (context) => MPPlatformView(
        viewType: 'design.ant.typography.title',
        viewAttributes: {
          'text': text,
          'level': level,
          'code': code,
          'copyable': copyable,
          'delete': delete,
          'disabled': disabled,
          'editable': editable,
          'ellipsis': ellipsis,
          'mark': mark,
          'italic': italic,
          'type': (() {
            switch (type) {
              case TypographyType.danger:
                return 'danger';
              case TypographyType.secondary:
                return 'secondary';
              case TypographyType.success:
                return 'success';
              case TypographyType.warning:
                return 'warning';
              default:
                return '';
            }
          })(),
          'underline': underline,
        }..removeWhere((key, value) => value == null),
        onMethodCall: (methodName, arguments) {
          if (methodName == 'onClick') {
            onClick?.call();
          } else if (methodName == 'editable.onStart') {
            editable?.onStart?.call();
          } else if (methodName == 'editable.onChange') {
            editable?.onChange?.call((arguments as Map)['value']);
          } else if (methodName == 'editable.onCancel') {
            editable?.onCancel?.call();
          } else if (methodName == 'editable.onEnd') {
            editable?.onEnd?.call();
          }
        },
      ),
    );
  }
}

class TypographyText extends StatelessWidget {
  final String? text;
  final bool? code;
  final bool? copyable;
  final bool? delete;
  final bool? disabled;
  final TypographyEditable? editable;
  final bool? ellipsis;
  final int level;
  final bool? keyboard;
  final bool? mark;
  final bool? strong;
  final bool? italic;
  final TypographyType? type;
  final bool? underline;

  final Function? onClick;

  TypographyText({
    this.text,
    this.code,
    this.copyable,
    this.delete,
    this.disabled,
    this.editable,
    this.ellipsis,
    this.level = 1,
    this.keyboard,
    this.mark,
    this.strong,
    this.italic,
    this.type,
    this.underline,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return MPPlatformViewWithIntrinsicContentSize(
      builder: (context) => MPPlatformView(
        viewType: 'design.ant.typography.text',
        viewAttributes: {
          'text': text,
          'level': level,
          'code': code,
          'copyable': copyable,
          'delete': delete,
          'disabled': disabled,
          'editable': editable,
          'ellipsis': ellipsis,
          'keyboard': keyboard,
          'mark': mark,
          'strong': strong,
          'italic': italic,
          'type': (() {
            switch (type) {
              case TypographyType.danger:
                return 'danger';
              case TypographyType.secondary:
                return 'secondary';
              case TypographyType.success:
                return 'success';
              case TypographyType.warning:
                return 'warning';
              default:
                return '';
            }
          })(),
          'underline': underline,
        }..removeWhere((key, value) => value == null),
        onMethodCall: (methodName, arguments) {
          if (methodName == 'onClick') {
            onClick?.call();
          } else if (methodName == 'editable.onStart') {
            editable?.onStart?.call();
          } else if (methodName == 'editable.onChange') {
            editable?.onChange?.call((arguments as Map)['value']);
          } else if (methodName == 'editable.onCancel') {
            editable?.onCancel?.call();
          } else if (methodName == 'editable.onEnd') {
            editable?.onEnd?.call();
          }
        },
      ),
    );
  }
}

class TypographyParagraph extends StatelessWidget {
  final String? text;
  final bool? code;
  final bool? copyable;
  final bool? delete;
  final bool? disabled;
  final TypographyEditable? editable;
  final bool? ellipsis;
  final int level;
  final bool? mark;
  final bool? strong;
  final bool? italic;
  final TypographyType? type;
  final bool? underline;

  final Function? onClick;

  TypographyParagraph({
    this.text,
    this.code,
    this.copyable,
    this.delete,
    this.disabled,
    this.editable,
    this.ellipsis,
    this.level = 1,
    this.mark,
    this.strong,
    this.italic,
    this.type,
    this.underline,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return MPPlatformViewWithIntrinsicContentSize(
      builder: (context) => MPPlatformView(
        viewType: 'design.ant.typography.paragraph',
        viewAttributes: {
          'text': text,
          'level': level,
          'code': code,
          'copyable': copyable,
          'delete': delete,
          'disabled': disabled,
          'editable': editable,
          'ellipsis': ellipsis,
          'mark': mark,
          'strong': strong,
          'italic': italic,
          'type': (() {
            switch (type) {
              case TypographyType.danger:
                return 'danger';
              case TypographyType.secondary:
                return 'secondary';
              case TypographyType.success:
                return 'success';
              case TypographyType.warning:
                return 'warning';
              default:
                return '';
            }
          })(),
          'underline': underline,
        }..removeWhere((key, value) => value == null),
        onMethodCall: (methodName, arguments) {
          if (methodName == 'onClick') {
            onClick?.call();
          } else if (methodName == 'editable.onStart') {
            editable?.onStart?.call();
          } else if (methodName == 'editable.onChange') {
            editable?.onChange?.call((arguments as Map)['value']);
          } else if (methodName == 'editable.onCancel') {
            editable?.onCancel?.call();
          } else if (methodName == 'editable.onEnd') {
            editable?.onEnd?.call();
          }
        },
      ),
    );
  }
}
