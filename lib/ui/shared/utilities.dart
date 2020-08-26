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

Widget removeScrollEffect({Widget child}) {
  return NotificationListener<OverscrollIndicatorNotification>(
    onNotification: (overscroll) {
      overscroll.disallowGlow();
      return true;
    },
    child: child,
  );
}

Widget conditionWidget({bool value, Widget onTrue, Widget onFalse}) {
  return (value) ? onTrue : onFalse;
}
