import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  /// Check if device has !working! internet connection
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker checker;

  const NetworkInfoImpl({required final this.checker});

  @override
  Future<bool> get isConnected async => await checker.hasConnection;
}
