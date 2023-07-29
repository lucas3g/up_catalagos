import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_catalagos/app/core_module/constants/constants.dart';
import 'package:up_catalagos/app/core_module/services/shared_preferences/local_storage_interface.dart';
import 'package:up_catalagos/app/core_module/services/theme_mode/theme_mode_controller.dart';

class MyDrawerWidget extends StatefulWidget {
  const MyDrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MyDrawerWidget> createState() => _MyDrawerWidgetState();
}

class _MyDrawerWidgetState extends State<MyDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: context.screenHeight * .15,
            child: Theme(
              data: ThemeData().copyWith(
                dividerColor: context.myTheme.background,
              ),
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: ThemeModeController.themeMode == ThemeMode.dark
                      ? context.myTheme.primaryContainer
                      : context.myTheme.primary,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lucas Silva',
                      style: context.textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: context.screenHeight * .85,
            color: ThemeModeController.themeMode == ThemeMode.dark
                ? backgroundBlack
                : context.myTheme.background,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    ListTile(
                      minLeadingWidth: 2,
                      leading: Icon(
                        ThemeModeController.themeMode == ThemeMode.dark
                            ? Icons.dark_mode
                            : Icons.light_mode,
                        color: ThemeModeController.themeMode == ThemeMode.dark
                            ? context.myTheme.primaryContainer
                            : context.myTheme.primary,
                      ),
                      title: Text(
                        ThemeModeController.themeMode == ThemeMode.dark
                            ? 'Dark'
                            : 'Light',
                      ),
                      onTap: ThemeModeController.appStore.changeThemeMode,
                    ),
                    ListTile(
                      minLeadingWidth: 2,
                      leading: Icon(
                        Icons.support_agent_rounded,
                        color: ThemeModeController.themeMode == ThemeMode.dark
                            ? context.myTheme.primaryContainer
                            : context.myTheme.primary,
                      ),
                      title: const Text('Suporte'),
                      onTap: () {},
                    ),
                  ],
                ),
                Column(
                  children: [
                    ListTile(
                      onTap: () async {
                        final localStorage = Modular.get<ILocalStorage>();

                        await localStorage.removeData('user');

                        Modular.to.navigate('/auth/');
                      },
                      minLeadingWidth: 2,
                      leading: Icon(
                        Icons.exit_to_app,
                        color: ThemeModeController.themeMode == ThemeMode.dark
                            ? context.myTheme.primaryContainer
                            : context.myTheme.primary,
                      ),
                      title: const Text(
                        'Sair',
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const ListTile(
                      title: Text(
                        'Versão 1.0.0',
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
