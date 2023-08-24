import 'package:events_time_microapp_dependencies/events_time_microapp_dependencies.dart';
import 'package:events_time_microapp_menu/events_time_microapp_menu.dart';
import 'package:events_time_microapp_menu/src/products/data/implementations/menu_datasource_impl.dart';
import 'package:events_time_microapp_menu/src/products/data/interfaces/menu_datasource.dart';
import 'package:events_time_microapp_menu/src/products/domain/implementations/usecases/get_menu_usecase_impl.dart';
import 'package:events_time_microapp_menu/src/products/domain/implementations/usecases/menu_usecase_impl.dart';
import 'package:events_time_microapp_menu/src/products/domain/interfaces/repositories/menu_repository.dart';
import 'package:events_time_microapp_menu/src/products/domain/interfaces/usecases/get_menu_usecase.dart';
import 'package:events_time_microapp_menu/src/products/domain/interfaces/usecases/menu_flow_usecase.dart';
import 'package:events_time_microapp_menu/src/products/infra/implementations/menu_repository_impl.dart';
import 'package:events_time_microapp_menu/src/products/presentation/controllers/menu_store.dart';

class RegisterDependenciesMenu implements IRegisterDependencies {
  @override
  Future<void> register() async {
    // Datasources
    MicroappMenu.injector.registerFactory<IMenuDatasource>(
        () => MenuDatasourceImpl(MicroappMenu.requesting));

    // Repositories
    MicroappMenu.injector.registerFactory<IMenuRepository>(
      () => MenuRepositoryImpl(MicroappMenu.injector.get()),
    );

    // Usecases
    MicroappMenu.injector.registerFactory<IGetMenuUsecase>(
      () => GetMenuUsecaseImpl(MicroappMenu.injector.get()),
    );

    MicroappMenu.injector.registerFactory<IMenuFlowUsecase>(
      () => MenuFlowUsecaseImpl(
        getMenuUsecase: MicroappMenu.injector.get(),
      ),
    );

    // Stores
    MicroappMenu.injector.registerFactory<MenuStore>(
      () => MenuStore(
        getMenuUsecase: MicroappMenu.injector.get(),
      ),
    );
  }
}
