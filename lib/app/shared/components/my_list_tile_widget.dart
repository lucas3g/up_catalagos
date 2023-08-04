import 'package:flutter/material.dart';
import 'package:up_catalagos/app/core_module/constants/constants.dart';

class MyListTileWidget extends StatelessWidget {
  final IconData leftIcon;
  final String title;
  final Function()? onTap;
  const MyListTileWidget(
      {super.key, required this.leftIcon, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        hoverColor: context.myTheme.onPrimary.withOpacity(0.4),
        minLeadingWidth: 2,
        leading: Icon(
          leftIcon,
          color: context.myTheme.primaryContainer,
        ),
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}
