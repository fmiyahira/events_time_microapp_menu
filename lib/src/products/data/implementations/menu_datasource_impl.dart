import 'package:events_time_microapp_dependencies/events_time_microapp_dependencies.dart';
import 'package:events_time_microapp_menu/src/products/data/interfaces/menu_datasource.dart';
import 'package:events_time_microapp_menu/src/products/domain/models/menu_model.dart';

class MenuDatasourceImpl implements IMenuDatasource {
  static const String ENDPOINT_MENU_ID = '/api/mobile/products/menu';
  final IRequesting requesting;

  MenuDatasourceImpl(this.requesting);

  @override
  Future<MenuModel> getMenu(int eventId) async {
    final RequestingResponse<dynamic> response = await requesting.get(
      ENDPOINT_MENU_ID,
      queryParameters: <String, dynamic>{
        'event_id': eventId,
      },
    );

    return MenuModel.fromMap(response.body as List<dynamic>);
  }
}
