import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_catalagos/app/modules/auth/presenter/auth_page.dart';

class AuthModule extends Module {
  @override
  final List<Module> imports = [];

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, args) => const AuthPage(),
    )
  ];
}
