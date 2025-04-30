import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionChecker {
  static Connectivity connectivity = Connectivity();

  static Future<bool> checkNetwork() async {
    ConnectivityResult result = await connectivity.checkConnectivity();
    if (result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile) {
      return true;
    } else {
      return false;
    }
  }
}
