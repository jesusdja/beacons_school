import 'package:beacons_school/initial_page.dart';
import 'package:flutter/material.dart';

abstract class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case InitialPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const InitialPage(),
        );
      default:
        throw Exception('Page ${settings.name} does not exists');
    }
  }
}
