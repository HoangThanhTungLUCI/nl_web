import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;

  Future<bool> get isWifiConnected;

  Future<bool> get isCellularConnected;

  Future<bool> get isBluetoothConnected;

  Future<bool> get isEthernetConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity _connectivity = Connectivity();

  NetworkInfoImpl._privateConstructor();

  static final NetworkInfoImpl _instance =
      NetworkInfoImpl._privateConstructor();

  static NetworkInfoImpl get instance => _instance;

  @override
  Future<bool> get isConnected async =>
      await _connectivity.checkConnectivity() == ConnectivityResult.wifi ||
      await _connectivity.checkConnectivity() == ConnectivityResult.mobile;

  @override
  Future<bool> get isBluetoothConnected async =>
      await _connectivity.checkConnectivity() == ConnectivityResult.bluetooth;

  @override
  Future<bool> get isCellularConnected async =>
      await _connectivity.checkConnectivity() == ConnectivityResult.mobile;

  @override
  Future<bool> get isWifiConnected async =>
      await _connectivity.checkConnectivity() == ConnectivityResult.wifi;

  @override
  Future<bool> get isEthernetConnected async =>
      await _connectivity.checkConnectivity() == ConnectivityResult.ethernet;
}
