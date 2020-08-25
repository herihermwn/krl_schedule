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
        await Future.delayed(Duration(seconds: 1));
        await replaceNavigate(HomePage());
      } else {
        showErrorSnackbar("Periksa kembali koneksi anda");
      }
    } else {
      _message = "Menyiapkan aplikasi...";
      await Future.delayed(Duration(seconds: 1));
      await replaceNavigate(UserProfillingPage());
    }
  }

  // -----------
  // Navigator
  // -----------
  Future<void> replaceNavigate(Widget page) async {
    await _navigationService.replaceWithTransition(
      page,
      transition: NavigationTransition.RightToLeftWithFade,
      duration: Duration(milliseconds: 300),
    );
  }
}
