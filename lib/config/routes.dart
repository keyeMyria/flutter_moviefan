import 'package:fluro/fluro.dart';

import './route_handlers.dart';

class Routes {
  static String home = "/home";

  static void configureRoutes(Router router) {
    router.define(Routes.home, handler: homeHandler);
  }
}
