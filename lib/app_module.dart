import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_catalagos/app/core_module/core_module.dart';
import 'package:up_catalagos/app/core_module/services/theme_mode/theme_mode_service.dart';
import 'package:up_catalagos/app/modules/auth/auth_module.dart';
import 'package:up_catalagos/app/modules/home/home_module.dart';
import 'package:up_catalagos/app/modules/splash/splash_module.dart';
import 'package:up_catalagos/app/shared/stores/app_store.dart';
import 'package:up_catalagos/app/utils/config_module.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    CoreModule(),
    SplashModule(),
    AuthModule(),
    HomeModule(),
  ];

  @override
  final List<Bind> binds = [
    //STORES
    AutoBind.singleton<AppStore>(AppStore.new),

    //THEME MODE
    AutoBind.singleton<IThemeMode>(ThemeModeService.new),
  ];

  @override
  final List<ModularRoute> routes = [
    configModule('/', module: SplashModule()),
    configModule('/auth', module: AuthModule()),
    configModule('/home', module: HomeModule()),
  ];
}
