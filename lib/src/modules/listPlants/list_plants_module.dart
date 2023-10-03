import 'package:flutter_modular/flutter_modular.dart';
import '../../services/plants/plants_service.dart';
import '../../services/plants/plants_service_impl.dart';
import '../home/home_controller.dart';
import 'list_plants_page.dart';

class ListPlantsModule extends Module {
  @override
  void exportedBinds(i) {
    i.addLazySingleton<PlantsService>(PlantsServiceImpl.new);
    i.addLazySingleton(HomeController.new);
  }

  // @override
  // List<BindConfig> get binds => [
  //       Bind.lazySingleton<PlantsService>(
  //         (i) => PlantsServiceImpl(i()),
  //       ),
  //       Bind.lazySingleton(
  //         (i) => HomeController(i()),
  //       )
  //     ];

  // @override
  // List<ModularRoute> get routes => [
  //       ChildRoute(
  //         '/',
  //         child: (context, args) => const ListPlantsPage(),
  //       ),
  //     ];

  @override
  void routes(r) {
    r.child('/', child: (context) => const ListPlantsPage());
  }
}
