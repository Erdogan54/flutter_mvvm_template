enum NetworkRoutes { LOGIN }

extension NetworkRoutesString on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.LOGIN:
        return "login";

      default:
        throw Exception("Route Not Found");
    }
  }
}
