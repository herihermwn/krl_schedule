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

dynamic condition({bool value, dynamic onTrue, dynamic onFalse}) {
  return (value) ? onTrue : onFalse;
}

String differenceCurrentTime(String time) {
  List<String> timeArray = time.split(":");

  final now = DateTime.now();
  final dateTime = DateTime(now.year, now.month, now.day,
      int.parse(timeArray[0]), int.parse(timeArray[1]));

  return "${dateTime.difference(now).inMinutes} Menit";
}
