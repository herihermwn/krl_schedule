part of 'viewmodels.dart';

class SplashViewmodel extends FutureViewModel<String> {
  String _message = "Menyiapkan aplikasi...";

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
    // Get station fav list
    String stringJson = await _sharedPrefService.getFromPref(favStation);
    await Future.delayed(Duration(seconds: 1));
    if (stringJson != null) {
      List<SelectedStation> stationList =
          (jsonDecode(stringJson) as List<dynamic>)
              .map((x) => SelectedStation.fromJson(x))
              .toList();
      await replacePage(HomePage(stationList));
    } else {
      await replacePage(UserProfillingPage());
    }
  }
}
