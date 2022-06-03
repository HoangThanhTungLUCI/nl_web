import 'package:flutter/material.dart';
import 'package:nl_web/core/utility/logging.dart';
import 'package:logger/logger.dart';

enum Flavor { development, staging, production }

class BuildConfig {
  BuildConfig._({
    required this.baseUrl,
    required this.websiteUrl,
    required this.connectTimeout,
    required this.receiveTimeout,
    required this.stfConnectTimeout,
    required this.stfReceiveTimeout,
    required this.flavor,
    this.color = Colors.blue,
  }) {
    Log.info(
        "Environment",
        '\nBuild Flavor:      $flavor\n'
            'BaseUrl:           $baseUrl\n'
            'WebsiteUrl:        $websiteUrl\n'
            'ConnectTimeout:    $connectTimeout\n'
            'ReceiveTimeout:    $receiveTimeout\n'
            'stfConnectTimeout: $stfConnectTimeout\n'
            'stfReceiveTimeout: $stfReceiveTimeout\n');
  }

  BuildConfig._development()
      : this._(
          baseUrl: 'https://jsonplaceholder.typicode.com',
          websiteUrl: '',
          // 10 seconds
          connectTimeout: 10000,
          // 10 seconds
          receiveTimeout: 10000,
          // 3 minute
          stfConnectTimeout: 300000,
          // 3 minute
          stfReceiveTimeout: 300000,
          flavor: Flavor.development,
        );

  BuildConfig._staging()
      : this._(
          baseUrl: '',
          websiteUrl: '',
          // 10 seconds
          connectTimeout: 10000,
          // 10 seconds
          receiveTimeout: 10000,
          // 3 minute
          stfConnectTimeout: 300000,
          // 3 minute
          stfReceiveTimeout: 300000,
          flavor: Flavor.staging,
        );

  BuildConfig._production()
      : this._(
          baseUrl: '',
          websiteUrl: '',
          // 10 seconds
          connectTimeout: 10000,
          // 10 seconds
          receiveTimeout: 10000,
          // 3 minute
          stfConnectTimeout: 300000,
          // 3 minute
          stfReceiveTimeout: 300000,
          flavor: Flavor.production,
        );

  static BuildConfig? _instance;

  static init({flavor}) {
    switch (flavor) {
      case "staging":
        _instance = BuildConfig._staging();
        break;
      case "production":
        _instance = BuildConfig._production();
        break;
      case "development":
      default:
        _instance = BuildConfig._development();
        break;
    }
    _iniLog(flavor);
  }

  static BuildConfig get() {
    assert(_instance != null);
    return _instance!;
  }

  static _iniLog(flavor) async {
    switch (_instance?.flavor) {
      case Flavor.development:
      case Flavor.staging:
        Log.setLevel(Level.verbose);
        break;
      case Flavor.production:
        Log.setLevel(Level.nothing);
        break;
      default:
        break;
    }
  }

  final String baseUrl;
  final String websiteUrl;

  final int connectTimeout;
  final int receiveTimeout;

  final int stfConnectTimeout;
  final int stfReceiveTimeout;

  final Flavor flavor;
  final Color color;

  static String flavorName() => _instance?.flavor.name ?? "";

  static bool isProduct() => _instance?.flavor == Flavor.production;

  static bool isStaging() => _instance?.flavor == Flavor.staging;

  static bool isDevelopment() => _instance?.flavor == Flavor.development;
}
