import 'package:events_time_microapp_menu/src/products/domain/interfaces/usecases/get_menu_usecase.dart';
import 'package:events_time_microapp_menu/src/products/domain/interfaces/usecases/menu_flow_usecase.dart';
import 'package:events_time_microapp_menu/src/products/domain/models/menu_model.dart';

class MenuFlowUsecaseImpl implements IMenuFlowUsecase {
  final IGetMenuUsecase getMenuUsecase;

  MenuFlowUsecaseImpl({
    required this.getMenuUsecase,
  });

  @override
  Future<MenuModel> call(int eventId) async {
    final MenuModel menuModel = await getMenuUsecase(eventId);

    return menuModel;
  }
}
