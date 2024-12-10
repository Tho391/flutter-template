enum Flavor {
  dev,
  qa,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Flutter Template Dev';
      case Flavor.qa:
        return 'Flutter Template QA';
      case Flavor.prod:
        return 'Flutter Template';
      default:
        return 'title';
    }
  }

}
