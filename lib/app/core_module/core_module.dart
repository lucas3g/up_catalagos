import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_catalagos/app/core_module/constants/constants.dart';

import 'services/client_http/client_http_interface.dart';
import 'services/client_http/dio_client_http.dart';
import 'services/shared_preferences/local_storage_interface.dart';
import 'services/shared_preferences/shared_preferences_service.dart';

Bind<Dio> _dioFactory() {
  final baseOptions = BaseOptions(
    baseUrl: baseUrl,
    headers: {'Content-Type': 'application/json'},
  );

  return Bind.factory<Dio>(
    (i) => Dio(baseOptions)..interceptors.add(DioInterceptor()),
  );
}

class CoreModule extends Module {
  @override
  final List<Bind> exportedBinds = [
    //DIO
    _dioFactory(),

    //CLIENTHTTP
    AutoBind.factory<IClientHttp>(DioClientHttp.new),

    //SHARED PREFERENCES
    // AutoBind.factory(
    //   (i) async => SharedPreferences.getInstance(),
    // ),

    //LOCAL STORAGE
    AutoBind.factory<ILocalStorage>(SharedPreferencesService.new),
  ];
}
