// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:up_catalagos/app/core_module/constants/constants.dart';

class MyElevatedButtonWidget extends StatefulWidget {
  final Widget label;
  final IconData? icon;
  final Function()? onPressed;
  final double? height;
  final double? width;
  final Color? backgroundColor;

  const MyElevatedButtonWidget({
    Key? key,
    required this.label,
    this.icon,
    required this.onPressed,
    this.height = 40,
    this.width,
    this.backgroundColor,
  }) : super(key: key);

  @override
  State<MyElevatedButtonWidget> createState() => _MyElevatedButtonWidgetState();
}

class _MyElevatedButtonWidgetState extends State<MyElevatedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width ?? context.screenWidth,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.backgroundColor ?? context.myTheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.zero,
        ),
        child: widget.label,
      ),
    );
  }
}
