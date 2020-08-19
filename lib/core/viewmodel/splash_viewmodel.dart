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
    if (await isConnectToInternet()) {
      _message = "Mendapatkan jadwal...";
      notifyListeners();
      await Future.delayed(Duration(seconds: 2));
      await navigateToProfillingPage();
    } else {
      showErrorSnackbar("Periksa kembali koneksi anda");
    }
  }

  Future<void> navigateToProfillingPage() async {
    await _navigationService.replaceWithTransition(
      UserProfillingPage(),
      transition: NavigationTransition.RightToLeftWithFade,
      duration: Duration(seconds: 2),
    );
  }
}
