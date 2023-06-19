import 'package:flutter_modular/flutter_modular.dart';

import '../../repositories/plants/plants_repository.dart';
import '../../repositories/plants/plants_repository_impl.dart';

class CoreModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<PlantsRepository>(
          (i) => PlantsRepositoryImpl(),
          export: true,
        ),
      ];
}
