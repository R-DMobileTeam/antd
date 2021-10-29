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
