import 'dart:async';
import 'package:nl_web/core/utility/constants.dart';
import 'package:flutter_keychain/flutter_keychain.dart';

class UserData {
  static void saveUser(String? phoneNumb, String? pwd) async {
    await FlutterKeychain.put(key: keychainPhoneNumber, value: phoneNumb ?? "");
    await FlutterKeychain.put(key: keychainPassword, value: pwd ?? "");
  }
  static Future<String?> getPhoneNumber() async {
    final String? phone = await FlutterKeychain.get(key: keychainPhoneNumber);
    return phone;
  }
  static Future<String?> getPwd() async {
    final String? pwd = await FlutterKeychain.get(key: keychainPassword);
    return pwd;
  }

}

