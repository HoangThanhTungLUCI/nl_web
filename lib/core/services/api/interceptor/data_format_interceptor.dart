import 'dart:io';

import 'package:dio/dio.dart';
import 'package:nl_web/core/services/response_code.dart';

class DataFormatInterceptor extends InterceptorsWrapper {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Log.info("Interceptor", "response:\n${response.toString()}");

    if (response.statusCode != HttpStatus.ok) {
      handler.reject(DioError(
          requestOptions: response.requestOptions,
          response: Response(
            headers: response.headers,
            statusCode: response.statusCode,
            requestOptions: response.requestOptions,
            isRedirect: response.isRedirect,
            statusMessage: response.statusMessage,
            redirects: response.redirects,
            extra: response.extra,
          ),
          type: DioErrorType.other));
      return;
    } else if (response.statusCode == HttpStatus.ok) {
      final code = response.data == null || response.data == null
          ? ResponseCode.serverUnknownError
          : response.statusCode;

      if (code != ResponseCode.serverSuccessfully) {
        handler.reject(DioError(
            requestOptions: response.requestOptions,
            response: Response(
              headers: response.headers,
              statusCode: response.statusCode,
              data: response.data,
              requestOptions: response.requestOptions,
              isRedirect: response.isRedirect,
              statusMessage: response.statusMessage,
              redirects: response.redirects,
              extra: response.extra,
            ),
            type: DioErrorType.response));
        return;
      }
    }

    super.onResponse(response, handler);
  }
}
