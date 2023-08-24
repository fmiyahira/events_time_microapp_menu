import 'package:events_time_microapp_menu/src/products/data/interfaces/menu_datasource.dart';
import 'package:events_time_microapp_menu/src/products/domain/interfaces/repositories/menu_repository.dart';
import 'package:events_time_microapp_menu/src/products/domain/models/menu_model.dart';

class MenuRepositoryImpl implements IMenuRepository {
  final IMenuDatasource menuDatasource;

  MenuRepositoryImpl(this.menuDatasource);

  @override
  Future<MenuModel> getMenu(int eventId) => menuDatasource.getMenu(eventId);
}
