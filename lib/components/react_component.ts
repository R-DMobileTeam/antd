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
      if (!window.ReactDOM || !window.React || !window.antd) {
      } else {
        res(true);
        return;
      }
      setTimeout(() => {
        if (!window.ReactDOM || !window.React || !window.antd) {
          res(false);
        } else {
          res(true);
        }
      }, 100);
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
      this.htmlElement,
      this.withIntrinsicContentSize()
        ? () => {
            var timer: any;
            var timeToCheck = 6;
            var checker = () => {
              timeToCheck--;
              if (timeToCheck < 0) {
                clearInterval(timer);
              }
              const contentSize = document
                .getElementById("d_" + this.refId)
                ?.getBoundingClientRect();
              if (contentSize) {
                console.log(contentSize);
                this.setSize({
                  width: Math.ceil(contentSize.width),
                  height: Math.ceil(contentSize.height),
                });
              }
            };
            timer = setInterval(checker, 4);
            setTimeout(checker, 0);
          }
        : undefined
    );
  }
}
