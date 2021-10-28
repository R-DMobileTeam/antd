import { ReactComponent } from "./react_component";

export class Button extends ReactComponent {
  elementType() {
    return "design.ant.button";
  }

  reactClass() {
    return antd.Button;
  }

  withIntrinsicContentSize() {
    return true;
  }

  onClick() {
    this.invokeMethod("onClick", {});
  }

  extraAttributes() {
    return {
      onClick: this.onClick.bind(this),
      icon: this.attributes.icon
        ? React.createElement(icons[this.attributes.icon])
        : undefined,
    };
  }
}
