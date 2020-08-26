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
    await Future.delayed(Duration(seconds: 1));
    if (await _sharedPrefService.getFromPref(favStation) != null) {
      await replacePage(HomePage());
    } else {
      await replacePage(UserProfillingPage());
    }
  }
}
