part of 'viewmodels.dart';

class SplashViewmodel extends FutureViewModel<String> {
  String _message = "Memeriksa koneksi internet...";

  @override
  Future<String> futureToRun() => init();

  Future<String> init() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return "Ver ${packageInfo.version}";
  }

  // ---------
  // Getter
  // ---------
  String get getMessage => _message;

  Future<void> getToken() async {
    if (await _sharedPrefService.getFromPref(favStation) != null) {
      if (await isConnectToInternet()) {
        _message = "Mendapatkan jadwal...";
        notifyListeners();
        await getScheduleStation();
      } else {
        showErrorSnackbar("Periksa kembali koneksi anda");
      }
    } else {
      _message = "Menyiapkan aplikasi...";
      await Future.delayed(Duration(seconds: 1));
      await navigateToProfillingPage();
    }
  }

  static Future<List<ScheduleStationResponse>> getScheduleStation() async {
    String stringJson = await _sharedPrefService.getFromPref(favStation);
    List<SelectedStation> stationList =
        (jsonDecode(stringJson) as List<dynamic>)
            .map((x) => SelectedStation.fromJson(x))
            .toList();

    List<ScheduleStationResponse> listSchedule = [];
    KrlFailedResponse message;

    String fromTime = DateFormat.Hm().format(DateTime.now());
    String toTimeHour = 1.hours.fromNow().hour.toString().padLeft(2, "0");
    String toTimeMinute = 1.hours.fromNow().minute.toString().padLeft(2, "0");

    for (int i = 0; i < stationList.length; i++) {
      Response response = await _krlService.getScheduleStation(
        stationList[i].stationId,
        fromTime,
        "$toTimeHour:$toTimeMinute",
      );

      if (response.statusCode == 200) {
        listSchedule.add(ScheduleStationResponse.fromJson(response.data));
      } else {
        message = KrlFailedResponse.fromJson(response.data);
      }
    }

    if (listSchedule.length == 0) {
      showErrorSnackbar(message.message);
    }

    return listSchedule;
  }

  // -----------
  // Navigator
  // -----------
  Future<void> navigateToProfillingPage() async {
    await _navigationService.replaceWithTransition(
      UserProfillingPage(),
      transition: NavigationTransition.RightToLeftWithFade,
      duration: Duration(milliseconds: 300),
    );
  }
}
