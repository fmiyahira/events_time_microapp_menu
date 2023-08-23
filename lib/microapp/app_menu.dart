import 'package:events_time_microapp_menu/microapp/microapp_menu.dart';
import 'package:events_time_microapp_menu/microapp/routes.dart';
import 'package:events_time_microapp_menu/src/products/presentation/pages/menu_page.dart';
import 'package:flutter/material.dart';

class AppMenu extends StatelessWidget {
  static const String route = MicroappMenu.name;
  static Map<String, dynamic>? routeArguments;

  final String? initialRoute;

  AppMenu.privateRoute({
    super.key,
    this.initialRoute = MenuPage.routeName,
  }) {
    routeArguments = null;
  }

  AppMenu.publicRoute({
    super.key,
    this.initialRoute,
    Map<String, dynamic>? arguments,
  }) {
    routeArguments = arguments;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu',
      initialRoute: initialRoute,
      routes: AppRoutes().privateRoutes,
    );
  }
}
