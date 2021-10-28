import { ReactComponent } from "./react_component";

export class Breadcrumb extends ReactComponent {
  elementType() {
    return "design.ant.breadcrumb";
  }

  reactClass() {
    return antd.Breadcrumb;
  }

  withIntrinsicContentSize() {
    return true;
  }

  extraChildren() {
    return this.attributes?.children?.map((it: any, index: number) => {
      return React.createElement(
        antd.Breadcrumb.Item,
        {
          ...it,
          onClick: () => {
            this.invokeMethod("onClick", { index });
          },
        },
        [it.text]
      );
    });
  }
}
