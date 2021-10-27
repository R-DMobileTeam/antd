import { ReactComponent } from "./react_component";

export class TypographyTitle extends ReactComponent {
  elementType() {
    return "design.ant.typography.title";
  }

  reactClass() {
    return antd.Typography.Title;
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
      editable: this.attributes.editable
        ? {
            ...this.attributes.editable,
            onStart: () => {
              this.invokeMethod("editable.onStart", {});
            },
            onChange: (value: string) => {
              this.invokeMethod("editable.onChange", { value: value });
            },
            onCancel: () => {
              this.invokeMethod("editable.onCancel", {});
            },
            onEnd: () => {
              this.invokeMethod("editable.onEnd", {});
            },
          }
        : false,
    };
  }
}

export class TypographyText extends ReactComponent {
  elementType() {
    return "design.ant.typography.text";
  }

  reactClass() {
    return antd.Typography.Text;
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
      editable: this.attributes.editable
        ? {
            ...this.attributes.editable,
            onStart: () => {
              this.invokeMethod("editable.onStart", {});
            },
            onChange: (value: string) => {
              this.invokeMethod("editable.onChange", { value: value });
            },
            onCancel: () => {
              this.invokeMethod("editable.onCancel", {});
            },
            onEnd: () => {
              this.invokeMethod("editable.onEnd", {});
            },
          }
        : false,
    };
  }
}

export class TypographyParagraph extends ReactComponent {
  elementType() {
    return "design.ant.typography.paragraph";
  }

  reactClass() {
    return antd.Typography.Paragraph;
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
      editable: this.attributes.editable
        ? {
            ...this.attributes.editable,
            onStart: () => {
              this.invokeMethod("editable.onStart", {});
            },
            onChange: (value: string) => {
              this.invokeMethod("editable.onChange", { value: value });
            },
            onCancel: () => {
              this.invokeMethod("editable.onCancel", {});
            },
            onEnd: () => {
              this.invokeMethod("editable.onEnd", {});
            },
          }
        : false,
    };
  }
}
