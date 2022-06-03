import 'dart:io';

import 'package:dio/dio.dart';
import 'package:nl_web/core/generated/l10n.dart';
import 'package:nl_web/core/services/response_code.dart';
import 'package:intl/intl.dart';

class ApiException {
  int? _errorCode = ResponseCode.clientUnknownError;

  get errorCode => _errorCode ?? ResponseCode.clientUnknownError;

  String? _errorMessage = ResponseCode.clientUnknownError.message;

  get errorMessage => _errorMessage ?? ResponseCode.clientUnknownError.message;

  DioError exception;

  String? get displayError {
    switch (exception.type) {
      case DioErrorType.connectTimeout:
        return S.current.connect_timeout;

      case DioErrorType.sendTimeout:
        return S.current.send_timeout;

      case DioErrorType.receiveTimeout:
        return S.current.receive_timeout;

      case DioErrorType.response:
      case DioErrorType.other:
      case DioErrorType.cancel:
        // Prioritize error returned in response body
        final responseData = exception.response?.data;
        if (responseData is Map && responseData["message"] != null) {
          final message = responseData["message"];
          if (message is List) {
            return message
                .map((e) => toBeginningOfSentenceCase(e.toString()))
                .join("\n");
          }

          return toBeginningOfSentenceCase(message.toString());
        }

        if (responseData is Map && responseData["error"] != null) {
          return responseData["error"].toString();
        }

        // Fallback to request error if no error returned in response body
        return exception.error?.toString() ?? exception.response?.statusMessage;
    }
  }

  ApiException(this.exception) {
    switch (exception.type) {
      case DioErrorType.response:
        {
          try {
            final code = exception.response?.code();
            _errorMessage =
                code?.message ?? ResponseCode.clientUnknownError.message;
            _errorCode = code;
          } catch (e) {
            _errorMessage = e.toString();
            // Try to get Dio internal error which might due to service not available
            if (exception.error != null) {
              _errorMessage = exception.error.toString();
            }
            if (exception.response?.statusMessage != null &&
                exception.response?.statusMessage?.isNotEmpty == true) {
              _errorMessage = exception.response?.statusMessage;
            }
          }
        }
        break;

      case DioErrorType.cancel:
        {
          _errorMessage = S.current.cancelled;
          break;
        }

      case DioErrorType.connectTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
        {
          _errorMessage = S.current.connect_timeout;
          _errorCode = ResponseCode.notConnectionInternet;
        }
        break;
      default:
        {
          if (exception.response?.statusCode == HttpStatus.notFound) {
            _errorMessage = S.current.server_not_found;
            _errorCode = ResponseCode.serverMaintain;
          }
          if (exception.response?.statusCode == HttpStatus.serviceUnavailable) {
            _errorMessage = S.current.server_unknown_error;
            _errorCode = ResponseCode.clientUnknownError;
          } else if (exception.error is SocketException) {
            _errorMessage = S.current.connection_problem;
            _errorCode = ResponseCode.notConnectionInternet;
          } else if (exception.error is HttpException) {
            _errorMessage = S.current.connection_problem;
            _errorCode = ResponseCode.notConnectionInternet;
          }
        }
    }
  }
}

extension ServerCode on Response {
  int code() => data == null || data["code"] == null
      ? ResponseCode.serverUnknownError
      : data["code"];
}
