import 'package:events_time_microapp_menu/src/products/domain/models/menu_model.dart';

abstract class IMenuRepository {
  Future<MenuModel?> getMenu(int eventId);
}
