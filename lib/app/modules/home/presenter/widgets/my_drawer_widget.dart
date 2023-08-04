import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:line_icons/line_icons.dart';
import 'package:up_catalagos/app/core_module/constants/constants.dart';
import 'package:up_catalagos/app/core_module/services/shared_preferences/local_storage_interface.dart';
import 'package:up_catalagos/app/core_module/services/theme_mode/theme_mode_controller.dart';
import 'package:up_catalagos/app/shared/components/my_list_tile_widget.dart';

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
                dividerColor: Colors.transparent,
              ),
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: context.myTheme.onPrimary,
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
                    MyListTileWidget(
                      leftIcon: LineIcons.readme,
                      title: 'Relatórios',
                      onTap: () {},
                    ),
                    MyListTileWidget(
                      leftIcon: Icons.notification_add,
                      title: 'Notificações',
                      onTap: () {},
                    ),
                  ],
                ),
                Column(
                  children: [
                    MyListTileWidget(
                      leftIcon: Icons.exit_to_app_rounded,
                      title: 'Sair',
                      onTap: () async {
                        final localStorage = Modular.get<ILocalStorage>();

                        await localStorage.removeData('user');

                        Modular.to.navigate('/auth/');
                      },
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
