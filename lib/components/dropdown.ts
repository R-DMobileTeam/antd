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

  extraAttributes() {
    return {
      overlay: React.createElement(
        antd.Menu,
        {},
        this.attributes.overlay.children.map((it: any) => {
          return React.createElement(antd.Menu.Item, it, [it.text]);
        })
      ),
    };
  }

  singleChildren() {
    return React.createElement(antd.Typography.Text, { style: { cursor: "pointer" } }, [this.attributes.text]);
  }
}
