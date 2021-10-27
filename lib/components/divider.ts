import { ReactComponent } from "./react_component";

export class Divider extends ReactComponent {
  elementType() {
    return "design.ant.divider";
  }

  reactClass() {
    return antd.Divider;
  }

  withIntrinsicContentSize() {
    return true;
  }
}
