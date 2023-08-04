import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_catalagos/app/modules/auth/presenter/auth_page.dart';

class AuthModule extends Module {
  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const AuthPage(),
    );
  }
}
