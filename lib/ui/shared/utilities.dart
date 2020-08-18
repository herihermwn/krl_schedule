part of 'shareds.dart';

Future<bool> isConnectToInternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());

  try {
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  } on TimeoutException catch (_) {
    return false;
  } on SocketException catch (_) {
    return false;
  }
}
