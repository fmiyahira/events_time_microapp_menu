import 'package:events_time_microapp_menu/src/products/data/implementations/menu_datasource_impl.dart';
import 'package:events_time_microapp_menu/src/products/domain/interfaces/repositories/menu_repository.dart';
import 'package:events_time_microapp_menu/src/products/domain/models/menu_model.dart';

class MenuRepositoryImpl implements IMenuRepository {
  final MenuDatasourceImpl menuDatasource;

  MenuRepositoryImpl({required this.menuDatasource});

  @override
  Future<MenuModel> getMenu(int eventId) => menuDatasource.getMenu(eventId);
}
