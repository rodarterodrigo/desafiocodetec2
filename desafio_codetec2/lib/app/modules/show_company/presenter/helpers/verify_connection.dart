import 'dart:io';

import 'package:desafio_codetec2/app/modules/show_company/presenter/shared/widgets/custom_toast.dart';

class VerifyConnection {

  static Future<bool> verifyConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty)
        return true;
      return false;
    } on SocketException catch (e) {
      await CustomFlutterToast.alert("Verifique sua conexão");
    }
    return false;
  }
}