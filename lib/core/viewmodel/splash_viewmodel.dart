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
    } else {
      showErrorSnackbar("Periksa kembali koneksi anda");
    }
  }
}
