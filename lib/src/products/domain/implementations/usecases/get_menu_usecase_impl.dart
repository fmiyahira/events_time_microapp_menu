import 'package:events_time_microapp_menu/src/products/domain/interfaces/repositories/menu_repository.dart';
import 'package:events_time_microapp_menu/src/products/domain/interfaces/usecases/get_menu_usecase_interface.dart';
import 'package:events_time_microapp_menu/src/products/domain/models/menu_model.dart';

abstract class GetMenuUsecaseImpl implements IGetMenuUsecaseInterface {
  final IMenuRepository repository;

  GetMenuUsecaseImpl(this.repository);

  @override
  Future<MenuModel?> call(int eventId) => repository.getMenu(eventId);
}
