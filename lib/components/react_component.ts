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

  static makeChildren(owner: ReactComponent, children: any[]): any[] {
    return children
      ?.map((it: any) => {
        if (it.type === "text") {
          return React.createElement("span", {}, it.text);
        } else if (it.type === "icon") {
          return React.createElement(icons[it.data]);
        } else if (it.type === "link") {
          return React.createElement(
            it.highlighted === true ? antd.Typography.Link : "span",
            {
              href: it.href,
              target: it.target,
              style: { cursor: "pointer" },
              onClick: it.onClick
                ? () => {
                    owner.invokeMethod("onClick", { target: it.onClick });
                  }
                : undefined,
            },
            this.makeChildren(owner, it.children)
          );
        } else if (it.type === "innerComponent") {
          try {
            let clazz = this.getComponentClass(it.componentName);
            return React.createElement(
              clazz,
              it.attributes,
              this.makeChildren(owner, it.children)
            );
          } catch (error) {}
        }
      })
      ?.filter((it) => it);
  }

  static getComponentClass(name: string) {
    let nameComponents = name.split(".");
    let cur: any = window;
    for (let index = 0; index < nameComponents.length; index++) {
      cur = cur[nameComponents[index]];
    }
    return cur;
  }

  waitingGlobalScopeReady() {
    return new Promise((res) => {
      if (
        !window.ReactDOM ||
        !window.React ||
        !window.icons ||
        !window.antd ||
        !window.moment
      ) {
      } else {
        res(true);
        return;
      }
      setTimeout(() => {
        if (
          !window.ReactDOM ||
          !window.React ||
          !window.antd ||
          !window.icons ||
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
    const children = ReactComponent.makeChildren(
      this,
      this.attributes.children
    );
    ReactDOM.render(
      React.createElement(
        this.reactClass(),
        {
          id: "d_" + this.refId,
          ...this.attributes,
          ...this.extraAttributes(),
        },
        children?.length === 1 ? children[0] : children
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
