import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_catalagos/app/core_module/services/shared_preferences/adapters/shared_params.dart';
import 'package:up_catalagos/app/core_module/services/shared_preferences/local_storage_interface.dart';
import 'package:up_catalagos/app/shared/components/my_elevated_button_widget.dart';
import 'package:up_catalagos/app/shared/stores/app_store.dart';

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
    final appStore = context.watch<AppStore>(
      (store) => store.themeMode,
    );

    return Scaffold(
      body: Center(
        child: MyElevatedButtonWidget(
          label: const Text('Troca Tema'),
          onPressed: appStore.changeThemeMode,
        ),
      ),
    );
  }
}
