import 'package:flutter_modular/flutter_modular.dart';

ModuleRoute configModule(
  String name, {
  required Module module,
  TransitionType? transition,
  CustomTransition? customTransition,
  Duration? duration,
  List<RouteGuard> guards = const [],
}) {
  return ModuleRoute(
    name,
    transition: transition,
    module: module,
    duration: duration,
  );
}
