import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_catalagos/app/core_module/core_module.dart';
import 'package:up_catalagos/app/core_module/services/theme_mode/theme_mode_service.dart';
import 'package:up_catalagos/app/modules/auth/auth_module.dart';
import 'package:up_catalagos/app/modules/home/home_module.dart';
import 'package:up_catalagos/app/modules/splash/splash_module.dart';
import 'package:up_catalagos/app/shared/stores/app_store.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    CoreModule(),
    SplashModule(),
    AuthModule(),
    HomeModule(),
  ];

  @override
  void binds(i) {
    //STORES
    i.addSingleton<AppStore>(AppStore.new);

    //THEME MODE
    i.addSingleton<IThemeMode>(ThemeModeService.new);
  }

  @override
  void routes(r) {
    r.module('/', module: SplashModule());
    r.module('/auth', module: AuthModule());
    r.module('/home', module: HomeModule());
  }
}
