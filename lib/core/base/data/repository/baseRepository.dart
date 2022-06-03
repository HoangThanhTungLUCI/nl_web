import 'dart:async';

import 'package:dio/dio.dart';

typedef CallApi<T, _> = Future<_> Function(T service);

abstract class BaseRepository<T> {
  final T service;

  BaseRepository(this.service);

  Future<_> withNetworkError<_>(CallApi<T, _> callApi) async {
    try {
      return await callApi(service);
    } on DioError {
      rethrow;
    }
  }
}
