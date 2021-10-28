class Menu {
  final List<MenuItem> children;

  Menu({
    required this.children,
  });

  Map toJson() {
    return {
      'children': children,
    };
  }
}

class MenuItem {
  final String? text;
  final String? href;
  final String? target;
  final Function? onClick;

  MenuItem({
    this.text,
    this.href,
    this.target,
    this.onClick,
  });

  Map toJson() {
    return {
      'text': text,
      'href': href,
      'target': target,
    }..removeWhere((key, value) => value == null);
  }
}
