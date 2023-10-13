import 'package:beacons_school/initial_page.dart';
import 'package:beacons_school/src/modules/admin/admin_home_page.dart';
import 'package:beacons_school/src/modules/admin/config_beacons_page.dart';
import 'package:beacons_school/src/modules/auth/login_page.dart';
import 'package:beacons_school/src/modules/parents/config_parents_page.dart';
import 'package:beacons_school/src/modules/parents/parents_home_page.dart';
import 'package:flutter/material.dart';

import '../../modules/auth/register_page.dart';

abstract class AppRouter {
  static String get initialPage => InitialPage.route;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case InitialPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const InitialPage(),
        );
      case SelectedTypeApp.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const SelectedTypeApp(),
        );
      case LoginPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const LoginPage(),
        );
      case RegisterPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const RegisterPage(),
        );
      case ConfigBeaconsPage.route:
        final isConfig = settings.arguments as bool?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => ConfigBeaconsPage(isConfig: isConfig ?? false),
        );
      case ConfigParentsPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const ConfigParentsPage(),
        );
      case ParentsHomePage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const ParentsHomePage(),
        );
      case AdminHomePage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const AdminHomePage(),
        );
      default:
        throw Exception('Page ${settings.name} does not exists');
    }
  }
}
