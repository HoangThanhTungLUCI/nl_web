import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:nl_web/core/utility/constants.dart';

class LocalStorageService {
  static final LocalStorageService _instance = LocalStorageService._internal();

  LocalStorageService._internal();

  factory LocalStorageService() {
    return _instance;
  }

  String fixture(String name) => File('$assetsPath$name').readAsStringSync();

  Future<String> getJson(String name) {
    return rootBundle.loadString('$assetsPath$name');
  }
}
