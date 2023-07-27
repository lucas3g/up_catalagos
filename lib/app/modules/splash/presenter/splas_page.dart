import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_catalagos/app/core_module/services/shared_preferences/adapters/shared_params.dart';
import 'package:up_catalagos/app/core_module/services/shared_preferences/local_storage_interface.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  init() async {
    final shared = Modular.get<ILocalStorage>();

    await shared.setData(params: SharedParams(key: 'key', value: 'value'));

    print(await shared.getData('key'));
  }

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
