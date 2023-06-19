import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/global/global_context.dart';
import 'core/ui/theme/theme_config.dart';

class AppWidget extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();
  AppWidget({super.key}) {
    GlobalContext.i.navigatoKey = _navigatorKey;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Vide Planta',
      theme: ThemeConfig.theme,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
