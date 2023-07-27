import 'package:connectivity_plus/connectivity_plus.dart';

class VerifyConnectivity {
  static Future<bool> verifyHasInternet() async {
    final conn = await (Connectivity().checkConnectivity());

    return (((conn == ConnectivityResult.mobile) ||
            (conn == ConnectivityResult.wifi)) ||
        (conn == ConnectivityResult.ethernet));
  }
}
