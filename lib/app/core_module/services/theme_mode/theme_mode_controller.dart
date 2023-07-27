import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_catalagos/app/shared/stores/app_store.dart';

import '../../../utils/get_current_context.dart';

class ThemeModeController {
  static ThemeMode get themeMode =>
      GetCurrentContext.navigatorKey.currentContext!
          .watch<AppStore>((store) => store.themeMode)
          .themeMode
          .value;
  static AppStore get appStore => GetCurrentContext.navigatorKey.currentContext!
      .watch<AppStore>((store) => store.themeMode);
}
