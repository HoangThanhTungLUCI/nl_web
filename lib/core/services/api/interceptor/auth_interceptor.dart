import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:nl_web/core/services/local/pref/sessions_pref.dart';

enum AuthType{
  nothing,
  tokenExpired,
}

StreamController<AuthType> _authStreamController = StreamController.broadcast();
Stream<AuthType> get authStream => _authStreamController.stream;

/// authentication by token
class AuthInterceptor extends Interceptor {
  static const String xApiKey = 'x-api-key';
  static const String accessToken = 'Authorization';

  /// code is 100 then logout
  /// code 3 retry request with the new token
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept'] = 'application/json';
    final session = SessionPref.getAccessToken();
    if (session != null && session.isNotEmpty) {
      options.headers[accessToken] = 'Bearer $session';
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == HttpStatus.ok) {
      final isCodeLogOut = response.data != null &&
          response.data != null &&
          response.statusCode == 100;
      if (isCodeLogOut) {
        killSession();
        return;
      }
    }
    super.onResponse(response, handler);
  }

  void killSession() {
    _authStreamController.sink.add(AuthType.tokenExpired);
  }
}
