import 'package:flutter/material.dart';

import '../../../modules/traveler/presentation/routers/travaler_router.dart';
import '../ui/containers/app_container.dart';

class Routers {
  static String get initialRoute => '/';

  static Map<String, Widget Function(BuildContext, dynamic)> routes = {
    '/': (context, _) => const AppContainer(),
    '/traveler': (context, _) => const TraveleRouter(),
  };

  static Route<Object> generateRoutes(RouteSettings settings) {
    final routerName = settings.name;
    final routerArgs = settings.arguments;

    final navigateTo = routes[routerName];

    return MaterialPageRoute(
      builder: (context) => navigateTo!.call(context, routerArgs),
    );
  }
}
