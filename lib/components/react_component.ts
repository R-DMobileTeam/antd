export class ReactComponent extends MPPlatformView {
  refId = Math.random().toString();

  elementType(): string {
    return "div";
  }

  reactClass(): any {
    return undefined;
  }

  withIntrinsicContentSize(): boolean {
    return false;
  }

  setAttributes(attributes: any) {
    super.setAttributes(attributes);
    this.updateRenderObject();
  }

  extraAttributes() {
    return {};
  }

  setChildren() {}

  waitingGlobalScopeReady() {
    return new Promise((res) => {
      if (!window.ReactDOM || !window.React || !window.antd || !window.moment) {
      } else {
        res(true);
        return;
      }
      setTimeout(() => {
        if (
          !window.ReactDOM ||
          !window.React ||
          !window.antd ||
          !window.moment
        ) {
          res(false);
        } else {
          res(true);
        }
      }, 200);
    });
  }

  async updateRenderObject() {
    while ((await this.waitingGlobalScopeReady()) !== true) {}
    ReactDOM.render(
      React.createElement(
        this.reactClass(),
        {
          id: "d_" + this.refId,
          ...this.attributes,
          ...this.extraAttributes(),
        },
        this.attributes.text
      ),
      this.htmlElement
    );
    if (this.withIntrinsicContentSize()) {
      const measuringNode = this.htmlElement.cloneNode(true) as HTMLElement;
      measuringNode.style.width = "unset";
      measuringNode.style.height = "unset";
      measuringNode.style.minWidth = cssLength(
        this.attributes.layoutConstraints.minWidth
      );
      measuringNode.style.maxWidth = cssLength(
        this.attributes.layoutConstraints.maxWidth
      );
      measuringNode.style.minHeight = cssLength(
        this.attributes.layoutConstraints.minHeight
      );
      measuringNode.style.maxHeight = cssLength(
        this.attributes.layoutConstraints.maxHeight
      );
      const result = measureHtmlElement(measuringNode);
      this.setSize({ width: result.width, height: result.height });
    }
  }
}

const cssLength = (value: string) => {
  if (value === "Infinity") {
    return "max-content";
  } else {
    return parseFloat(value) + "px";
  }
};

const measureHtmlElement = (htmlElement: HTMLElement) => {
  htmlElement.style.position = "fixed";
  htmlElement.style.top = "0px";
  htmlElement.style.left = "0px";
  htmlElement.style.opacity = "0px";
  document.body.appendChild(htmlElement);
  const rect = htmlElement.getBoundingClientRect();
  htmlElement.remove();
  return {
    width: rect?.width ?? 0,
    height: rect?.height ?? 0,
  };
};
