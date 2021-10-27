/// <reference path="./plugin.d.ts" />

import { Button } from "./components/button";
import { TypographyParagraph, TypographyText, TypographyTitle } from "./components/typography";

class AntDesign {
  static installAntDesign() {
    const styleElement = document.createElement("link");
    styleElement.rel = "stylesheet";
    styleElement.type = "text/css";
    styleElement.href =
      "https://cdn.jsdelivr.net/npm/antd@4.16.13/dist/antd.min.css";
    document.head.appendChild(styleElement);
    const scriptElement = document.createElement("script");
    scriptElement.src =
      "https://cdn.jsdelivr.net/npm/antd@4.16.13/dist/antd.min.js";
    document.body.appendChild(scriptElement);
  }

  static installReact() {
    const reactScriptElement = document.createElement("script");
    reactScriptElement.src =
      "https://cdn.jsdelivr.net/npm/react@17.0.2/umd/react.production.min.js";
    document.body.appendChild(reactScriptElement);
    const reactDOMScriptElement = document.createElement("script");
    reactDOMScriptElement.src =
      "https://cdn.jsdelivr.net/npm/react-dom@17.0.2/umd/react-dom.production.min.js";
    document.body.appendChild(reactDOMScriptElement);
    const momentScriptElement = document.createElement("script");
    momentScriptElement.src =
      "https://cdn.jsdelivr.net/npm/moment@2.29.1/moment.min.js";
    document.body.appendChild(momentScriptElement);
  }
}

AntDesign.installReact();
AntDesign.installAntDesign();

pluginRegisterer.registerPlatformView("design.ant.button", Button);
pluginRegisterer.registerPlatformView(
  "design.ant.typography.title",
  TypographyTitle
);
pluginRegisterer.registerPlatformView(
  "design.ant.typography.text",
  TypographyText
);
pluginRegisterer.registerPlatformView(
  "design.ant.typography.paragraph",
  TypographyParagraph
);
