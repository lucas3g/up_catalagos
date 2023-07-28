import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_catalagos/app/shared/stores/app_store.dart';
import 'package:up_catalagos/app/shared/themes/themes.dart';

import 'app/utils/get_current_context.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.setNavigatorKey(GetCurrentContext.navigatorKey);

    Modular.setObservers([
      BotToastNavigatorObserver(),
    ]);

    final appStore = context.watch<AppStore>(
      (store) => store.themeMode,
    );

    return MaterialApp.router(
      title: 'UP Catálogos',
      debugShowCheckedModeBanner: false,
      themeMode: appStore.themeMode.value,
      theme: lightTheme,
      darkTheme: darkTheme,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      builder: (context, child) => BotToastInit()(context, child),
    );
  }
}
