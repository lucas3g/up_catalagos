import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_catalagos/app/modules/home/presenter/home_page.dart';

class HomeModule extends Module {
  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const HomePage(),
    );
  }
}
