import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_catalagos/app/modules/splash/presenter/splas_page.dart';

class SplashModule extends Module {
  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const SplashPage(),
    );
  }
}
