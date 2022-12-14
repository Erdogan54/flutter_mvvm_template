// ignore: constant_identifier_names
enum NetworkRoutes { LOGIN, BUILD_HOME }

extension NetworkRoutesString on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.LOGIN:
        return "login";
      case NetworkRoutes.BUILD_HOME:
        return "house";

      default:
        throw Exception("Route Not Found");
    }
  }
}
