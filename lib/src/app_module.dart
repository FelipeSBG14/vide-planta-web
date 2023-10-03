import 'package:flutter_modular/flutter_modular.dart';
import 'modules/core/core_module.dart';
import 'modules/home/home_module.dart';
import 'modules/listPlants/list_plants_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  // @override
  // List<ModularRoute> get routes => [
  //       ModuleRoute(
  //         '/',
  //         module: HomeModule(),
  //       ),
  //       ModuleRoute(
  //         '/listPlants/',
  //         module: ListPlantsModule(),
  //       ),
  //     ];

  @override
  void routes(RouteManager r) {
    r.module('/', module: HomeModule());
    r.module('/listPlants/', module: ListPlantsModule());
  }
}
//teste