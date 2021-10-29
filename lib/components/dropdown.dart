import 'package:antd/components/menu.dart';
import 'package:flutter/widgets.dart';
import 'package:mpcore/mpcore.dart';

import 'react_component.dart';

enum DropdownPlacement {
  bottomLeft,
  bottomCenter,
  bottomRight,
  topLeft,
  topCenter,
  topRight
}

enum DropdownTrigger { click, hover, contextMenu }

class Dropdown extends StatelessWidget {
  final Menu overlay;
  final AntComponent child;
  final bool? arrow;
  final bool? disabled;
  final bool? destroyPopupOnHide;
  final DropdownPlacement? placement;
  final List<DropdownTrigger>? trigger;

  Dropdown({
    required this.overlay,
    String? text,
    AntIcon? icon,
    required this.child,
    this.arrow,
    this.disabled,
    this.destroyPopupOnHide,
    this.placement,
    this.trigger,
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
            'arrow': arrow,
            'disabled': disabled,
            'destroyPopupOnHide': destroyPopupOnHide,
            'placement': (() {
              switch (placement) {
                case DropdownPlacement.bottomCenter:
                  return 'bottomCenter';
                case DropdownPlacement.bottomLeft:
                  return 'bottomLeft';
                case DropdownPlacement.bottomRight:
                  return 'bottomRight';
                case DropdownPlacement.topCenter:
                  return 'topCenter';
                case DropdownPlacement.topLeft:
                  return 'topLeft';
                case DropdownPlacement.topRight:
                  return 'topRight';
                default:
                  return null;
              }
            })(),
            'trigger': (() {
              return trigger?.map((e) {
                switch (e) {
                  case DropdownTrigger.click:
                    return 'click';
                  case DropdownTrigger.hover:
                    return 'hover';
                  case DropdownTrigger.contextMenu:
                    return 'contextMenu';
                }
              }).toList();
            })()
          }..removeWhere((key, value) => value == null),
          onMethodCall: (methodName, arguments) {
            AntLink.handleMethodCall(methodName, arguments, [child, overlay]);
          },
        );
      },
    );
  }
}

class DropdownButton extends StatelessWidget {
  final Menu overlay;
  final AntIcon? icon;
  final AntComponent child;
  final bool? arrow;
  final bool? disabled;
  final bool? destroyPopupOnHide;
  final DropdownPlacement? placement;
  final List<DropdownTrigger>? trigger;
  final Function? onClick;
  final String? href;
  final String? target;

  DropdownButton({
    required this.overlay,
    this.icon,
    String? text,
    AntComponent? child,
    this.arrow,
    this.disabled,
    this.destroyPopupOnHide,
    this.placement,
    this.trigger,
    this.onClick,
    this.href,
    this.target,
  }) : this.child = (() {
          if (child != null)
            return child;
          else if (text != null)
            return AntText(text: text);
          else
            return AntText(text: '');
        })();

  @override
  Widget build(BuildContext context) {
    return MPPlatformViewWithIntrinsicContentSize(
      builder: (context) {
        return MPPlatformView(
          viewType: 'design.ant.dropdown.button',
          viewAttributes: {
            'overlay': overlay,
            'icon': icon,
            'children': [child],
            'arrow': arrow,
            'disabled': disabled,
            'destroyPopupOnHide': destroyPopupOnHide,
            'placement': (() {
              switch (placement) {
                case DropdownPlacement.bottomCenter:
                  return 'bottomCenter';
                case DropdownPlacement.bottomLeft:
                  return 'bottomLeft';
                case DropdownPlacement.bottomRight:
                  return 'bottomRight';
                case DropdownPlacement.topCenter:
                  return 'topCenter';
                case DropdownPlacement.topLeft:
                  return 'topLeft';
                case DropdownPlacement.topRight:
                  return 'topRight';
                default:
                  return null;
              }
            })(),
            'trigger': (() {
              return trigger?.map((e) {
                switch (e) {
                  case DropdownTrigger.click:
                    return 'click';
                  case DropdownTrigger.hover:
                    return 'hover';
                  case DropdownTrigger.contextMenu:
                    return 'contextMenu';
                }
              }).toList();
            })(),
            'onClick': onClick != null ? hashCode : null,
            'href': href,
            'target': target,
          }..removeWhere((key, value) => value == null),
          onMethodCall: (methodName, arguments) {
            AntLink.handleMethodCall(methodName, arguments, [child, overlay]);
            if (methodName == 'onClick' &&
                arguments is Map &&
                arguments['target'] == hashCode) {
              onClick?.call();
            }
          },
        );
      },
    );
  }
}
