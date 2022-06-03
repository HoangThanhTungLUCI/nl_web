import 'package:nl_web/core/generated/l10n.dart';

class ResponseCode {
  // Error
  static const int serverSuccessfully = 200;
  static const int serverUnknownError = 1;


  static const int clientUnknownError = 9000;
  static const int notConnectionInternet = 9001;
  static const int serverMaintain = 9002;
}

extension MessageResponse on int {
  String? get message => messages[this];

  static final messages = <int, String>{
    ResponseCode.serverSuccessfully: S.current.server_unknown_error,
    ResponseCode.serverUnknownError: S.current.server_successfully
  };
}
