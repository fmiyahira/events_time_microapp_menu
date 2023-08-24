import 'package:events_time_microapp_menu/src/products/domain/interfaces/usecases/get_menu_usecase.dart';
import 'package:events_time_microapp_menu/src/products/domain/models/menu_model.dart';
import 'package:events_time_microapp_menu/src/products/presentation/controllers/menu_states.dart';
import 'package:flutter/material.dart';

class MenuStore extends ValueNotifier<MenuStates> {
  final IGetMenuUsecase getMenuUsecase;

  MenuModel? menuModel;

  MenuStore({required this.getMenuUsecase}) : super(InitialMenuStates());

  Future<void> getMenuByEvent(int eventId) async {
    value = LoadingMenuStates();

    // try {
    menuModel = await getMenuUsecase(eventId);

    value = LoadedMenuStates();
    // } catch (e) {
    //   value = ErrorMenuStates(e.toString());
    // }
  }
}
