import 'package:flutter_modular/flutter_modular.dart';
import '../../services/plants/plants_service.dart';
import '../../services/plants/plants_service_impl.dart';
import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends Module {
  // @override
  // List<Bind> get binds => [
  //       Bind.lazySingleton<PlantsService>(
  //         (i) => PlantsServiceImpl(i()),
  //       ),
  //       Bind.lazySingleton(
  //         (i) => HomeController(i()),
  //       )
  //     ];

  @override
  void exportedBinds(i) {
    i.addLazySingleton<PlantsService>(PlantsServiceImpl.new);
    i.addLazySingleton(HomeController.new);
  }

  // @override
  // List<ModularRoute> get routes => [
  //       ChildRoute('/', child: (context, args) => const HomePage()),
  //     ];
  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
  }
}
