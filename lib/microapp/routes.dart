import 'package:events_time_microapp_menu/microapp/app_menu.dart';
import 'package:events_time_microapp_menu/src/products/presentation/pages/menu_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  Map<String, WidgetBuilder> get publicRoutes => <String, WidgetBuilder>{
        AppMenu.route: (_) => AppMenu.publicRoute(
              initialRoute: MenuPage.routeName,
            ),
      };

  Map<String, WidgetBuilder> get privateRoutes => <String, WidgetBuilder>{
        MenuPage.routeName: (BuildContext context) => const MenuPage(),
      };
}
