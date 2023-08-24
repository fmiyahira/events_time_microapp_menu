// ignore_for_file: prefer_initializing_formals

import 'dart:async';

import 'package:events_time_microapp_auth/events_time_microapp_auth.dart';
import 'package:events_time_microapp_dependencies/events_time_microapp_dependencies.dart';
import 'package:events_time_microapp_hub/events_time_microapp_hub.dart';
import 'package:events_time_microapp_menu/microapp/routes.dart';
import 'package:events_time_microapp_menu/src/core/utils/enums/menu_goal_enum.dart';
import 'package:events_time_microapp_menu/src/products/core/register_dependencies_menu.dart';
import 'package:flutter/material.dart';

class MicroappMenuConfig {
  MenuGoalEnum menuGoalEnum;
  String destinationAfterConfirm;

  MicroappMenuConfig({
    required this.menuGoalEnum,
    required this.destinationAfterConfirm,
  });
}

class MicroappMenu extends ISubApp {
  static const String name = 'menu';
  static late MicroappMenuConfig microappMenuConfig;
  static late IRequesting requesting;
  static late IInjector injector;
  static late ILocalStorage localStorage;
  static late GlobalKey<NavigatorState> mainNavigatorKey;
  static late MicroappHub hub;

  LoggedEventModel? loggedEvent;

  MicroappMenu({required MicroappMenuConfig microappMenuConfig}) {
    MicroappMenu.microappMenuConfig = microappMenuConfig;
  }

  @override
  SubAppRegistration register() {
    return SubAppRegistration(
      name: MicroappMenu.name,
      routes: AppRoutes().publicRoutes,
    );
  }

  @override
  Future<void> initialize({
    required IRequesting requesting,
    required IInjector injector,
    required ILocalStorage localStorage,
    required GlobalKey<NavigatorState> mainNavigatorKey,
    required Map<String, ValueNotifier<dynamic>> messengers,
  }) async {
    MicroappMenu.requesting = requesting;
    MicroappMenu.injector = injector;
    MicroappMenu.localStorage = localStorage;
    MicroappMenu.mainNavigatorKey = mainNavigatorKey;
    MicroappMenu.hub = messengers['hub']! as MicroappHub;

    await registerDependencies();

    registerMessengersListeners();
  }

  Future<void> registerDependencies() async {
    // Register dependencies
    final List<IRegisterDependencies> listInternalDependencies =
        <IRegisterDependencies>[
      RegisterDependenciesMenu()
      // RegisterDependenciesMenu(),
    ];

    for (final IRegisterDependencies internalDependency
        in listInternalDependencies) {
      await internalDependency.register();
    }
  }

  void registerMessengersListeners() {
    MicroappMenu.hub.addListener(() {
      if (hub.value is ResponseEventSelectedHubState) {
        loggedEvent = (hub.value as ResponseEventSelectedHubState).payload
            as LoggedEventModel?;
        return;
      }

      if (hub.value is LogoutHubState) {
        return;
      }
    });
  }
}
