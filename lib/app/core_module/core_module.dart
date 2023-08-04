import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_catalagos/app/core_module/constants/constants.dart';

import 'services/client_http/client_http_interface.dart';
import 'services/client_http/dio_client_http.dart';
import 'services/shared_preferences/local_storage_interface.dart';
import 'services/shared_preferences/shared_preferences_service.dart';

Dio _dioFactory() {
  final baseOptions = BaseOptions(
    baseUrl: baseUrl,
    headers: {'Content-Type': 'application/json'},
  );

  return Dio(baseOptions)..interceptors.add(DioInterceptor());
}

class CoreModule extends Module {
  @override
  void exportedBinds(i) {
    //DIO
    i.add(_dioFactory);

    //CLIENTHTTP
    i.add<IClientHttp>(DioClientHttp.new);

    //LOCAL STORAGE
    i.add<ILocalStorage>(SharedPreferencesService.new);
  }
}
