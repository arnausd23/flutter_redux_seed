class NavigateToAction {
  final String route;

  NavigateToAction(this.route);

  @override
  String toString() {
    return 'NavigateToAction -> $route';
  }
}

class NavigateReplaceAction {
  final String route;

  NavigateReplaceAction(this.route);

  @override
  String toString() {
    return 'NavigateReplaceAction -> $route';
  }
}