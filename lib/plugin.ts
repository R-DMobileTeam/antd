/// <reference path="./plugin.d.ts" />

import { Button } from "./components/button";
import { Divider } from "./components/divider";
import { TypographyParagraph, TypographyText, TypographyTitle } from "./components/typography";

class AntDesign {
  static loadScript(src: string): Promise<any> {
    return new Promise((res) => {
      const scriptElement = document.createElement("script");
      scriptElement.src = src;
      scriptElement.onload = function () {
        res(null);
      };
      document.body.appendChild(scriptElement);
    });
  }

  static async installAntDesign() {
    const styleElement = document.createElement("link");
    styleElement.rel = "stylesheet";
    styleElement.type = "text/css";
    styleElement.href = "https://cdn.jsdelivr.net/npm/antd@4.16.13/dist/antd.min.css";
    document.head.appendChild(styleElement);
    await this.loadScript("https://cdn.jsdelivr.net/npm/antd@4.16.13/dist/antd.min.js");
  }

  static async installReact() {
    await this.loadScript("https://cdn.jsdelivr.net/npm/react@17.0.2/umd/react.production.min.js");
    await this.loadScript("https://cdn.jsdelivr.net/npm/react-dom@17.0.2/umd/react-dom.production.min.js");
    await this.loadScript("https://cdn.jsdelivr.net/npm/moment@2.29.1/moment.min.js");
  }
}

(async () => {
  await AntDesign.installReact();
  await AntDesign.installAntDesign();
})();

pluginRegisterer.registerPlatformView("design.ant.button", Button);
pluginRegisterer.registerPlatformView("design.ant.typography.title", TypographyTitle);
pluginRegisterer.registerPlatformView("design.ant.typography.text", TypographyText);
pluginRegisterer.registerPlatformView("design.ant.typography.paragraph", TypographyParagraph);
pluginRegisterer.registerPlatformView("design.ant.divider", Divider);
