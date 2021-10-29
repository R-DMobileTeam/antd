import { ReactComponent } from "./react_component";

export class Dropdown extends ReactComponent {
  elementType() {
    return "design.ant.dropdown";
  }

  reactClass() {
    return antd.Dropdown;
  }

  withIntrinsicContentSize() {
    return true;
  }

  extraAttributes(): { overlay: any } {
    return {
      overlay: ReactComponent.makeChildren(this, [
        this.attributes.overlay,
      ])?.[0],
    };
  }
}

export class DropdownButton extends ReactComponent {
  elementType() {
    return "design.ant.dropdown.button";
  }

  reactClass() {
    return antd.Dropdown.Button;
  }

  withIntrinsicContentSize() {
    return true;
  }

  onClick() {
    this.invokeMethod("onClick", { target: this.attributes.onClick });
  }

  extraAttributes(): any {
    return {
      overlay: ReactComponent.makeChildren(this, [
        this.attributes.overlay,
      ])?.[0],
      icon: ReactComponent.makeChildren(this, [this.attributes.icon])?.[0],
      onClick: this.attributes.onClick ? this.onClick.bind(this) : undefined,
    };
  }
}
