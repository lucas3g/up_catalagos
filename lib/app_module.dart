import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_catalagos/app/core_module/core_module.dart';
import 'package:up_catalagos/app/core_module/services/theme_mode/theme_mode_service.dart';
import 'package:up_catalagos/app/modules/splash/splash_module.dart';
import 'package:up_catalagos/app/shared/stores/app_store.dart';
import 'package:up_catalagos/app/utils/config_module.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    CoreModule(),
    SplashModule(),
  ];

  @override
  final List<Bind> binds = [
    //STORES
    AutoBind.factory<AppStore>(AppStore.new),

    //THEME MODE
    AutoBind.factory<IThemeMode>(ThemeModeService.new),
  ];

  @override
  final List<ModularRoute> routes = [
    configModule('/', module: SplashModule()),
  ];
}
