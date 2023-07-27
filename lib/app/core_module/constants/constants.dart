import 'dart:io';

import 'package:flutter/material.dart';

const baseUrl = String.fromEnvironment('BASE_URL');
const appIdPush = String.fromEnvironment('APP_ID_PUSH');

const pathLogo = 'assets/images/logo.png';

const backgroundBlack = Color(0xFF202123);
const labelPapagaio = Color(0xFF009342);
const labelRed = Color(0xffCB5252);

const cnpj = '87712725';

const urlRegister = '/setJson/$cnpj/usuarios';
const urlVerifyCPF = '/getJson/$cnpj/usuarios';
const urlLogin = '/login/$cnpj';
const urlPointsBalance = '/getJson/$cnpj/pontos';
const urlHistorics = '/getJson/$cnpj/mov';
const urlCompanies = '/getJson/$cnpj/locais/locais';
const urlOffers = '/getJsonImagens/$cnpj';
const urlNotifications = '/getJsonNotificacoes/$cnpj/notificacoes';
const urlForgotPassword = '/EnviarEmail/$cnpj';
const urlGetEmailUser = '/getJson/$cnpj/usuarios';

const double kPadding = 20;

extension ContextExtensions on BuildContext {
  ColorScheme get myTheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;

  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;

  void closeKeyboard() => FocusScope.of(this).unfocus();

  Size get sizeAppbar {
    final height = AppBar().preferredSize.height;

    return Size(
      screenWidth,
      height +
          (Platform.isWindows
              ? 75
              : Platform.isIOS
                  ? 50
                  : 70),
    );
  }
}

// class GlobalUser {
//   GlobalUser._();

//   static GlobalUser instance = GlobalUser._();

//   late User _user;

//   bool getUser() {
//     final shared = Modular.get<ILocalStorage>();

//     final user = shared.getData('user');

//     if (user != null) {
//       _user = UserAdapter.fromMap(jsonDecode(user));

//       return true;
//     }

//     return false;
//   }

//   User get user => _user;
// }
