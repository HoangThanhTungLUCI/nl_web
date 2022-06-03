import 'dart:async';

import 'package:dio/dio.dart';
import 'package:nl_web/core/di/di_module.dart';
import 'package:nl_web/core/environment/build_config.dart';
import 'package:nl_web/core/services/api/interceptor/auth_interceptor.dart';
import 'package:nl_web/core/services/api/interceptor/data_format_interceptor.dart';

class ApiModule extends DIModule {
  @override
  provides() async {
    // register api
    // final dioMain = await setupMain();
    // getIt.registerSingleton(Apis(dioMain, baseUrl: dioMain.options.baseUrl));
    // final dioStf = await setupStf();
    // getIt.registerSingleton(StfApi(dioStf, baseUrl: dioStf.options.baseUrl));

    final options = BaseOptions(
      connectTimeout: BuildConfig.get().stfConnectTimeout,
      receiveTimeout: BuildConfig.get().stfReceiveTimeout,
      sendTimeout: BuildConfig.get().stfReceiveTimeout,
      responseType: ResponseType.json,
      validateStatus: (status) {
        return true;
      },
      baseUrl: BuildConfig.get().baseUrl,
    );
    final dio = Dio(options);
    dio.interceptors.add(AuthInterceptor());

    dio.interceptors.add(DataFormatInterceptor());

    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );

    sl.registerSingleton(dio);
  }

  static FutureOr<Dio> setupMain() async {
    final options = BaseOptions(
      connectTimeout: BuildConfig.get().connectTimeout,
      receiveTimeout: BuildConfig.get().receiveTimeout,
      responseType: ResponseType.json,
      validateStatus: (status) {
        return true;
      },
      baseUrl: BuildConfig.get().baseUrl,
    );
    final Dio dio = Dio(options);

    /// Unified add authentication request header
    dio.interceptors.add(AuthInterceptor());

    // dio.interceptors.add(RetryInterceptor(dio));

    dio.interceptors.add(DataFormatInterceptor());

    /// Print Log (production mode removal)
    // if (BuildConfig.get().flavor != Flavor.PRODUCTION) {
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
    // }
    return dio;
  }

  static FutureOr<Dio> setupStf() async {
    final options = BaseOptions(
      connectTimeout: BuildConfig.get().stfConnectTimeout,
      receiveTimeout: BuildConfig.get().stfReceiveTimeout,
      sendTimeout: BuildConfig.get().stfReceiveTimeout,
      responseType: ResponseType.json,
      validateStatus: (status) {
        return true;
      },
      baseUrl: BuildConfig.get().baseUrl,
    );
    final Dio dio = Dio(options);

    /// Unified add authentication request header
    dio.interceptors.add(AuthInterceptor());

    dio.interceptors.add(DataFormatInterceptor());

    /// Print Log (production mode removal)
    // if (BuildConfig.get().flavor != Flavor.PRODUCTION) {
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
    // }
    return dio;
  }
}
