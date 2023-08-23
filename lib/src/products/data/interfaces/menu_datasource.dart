import 'package:events_time_microapp_menu/src/products/domain/models/menu_model.dart';

abstract class IMenuDatasource {
  Future<MenuModel> getMenu(int eventId);
}
