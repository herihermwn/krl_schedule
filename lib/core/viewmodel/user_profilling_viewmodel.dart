part of 'viewmodels.dart';

class UserProfillingViewmodel extends BaseViewModel {
  List<SelectedStation> selectStationList = [];

  Future<void> navigateToHomePage() async {
    if (selectStationList.length != 0) {
      await _sharedPrefService.saveToPref(
        value: jsonEncode(selectStationList),
        key: favStation,
      );
      // await _navigationService.replaceWithTransition(
      //   page(),
      //   transition: NavigationTransition.RightToLeftWithFade,
      //   duration: Duration(milliseconds: 500),
      // );
    } else {
      showErrorSnackbar("Anda belum menambahkan stasiun (minimal 1)");
    }
  }

  Future<void> removeStatiunList(int index) async {
    selectStationList.removeAt(index);
    notifyListeners();
  }

  Future<void> addStatiunList() async {
    if (selectStationList.length < 3) {
      SelectedStation selectedStation =
          await _navigationService.navigateWithTransition(
        TambahStasiunPage(),
        transition: NavigationTransition.RightToLeftWithFade,
        duration: Duration(milliseconds: 300),
      );
      if (selectedStation != null) {
        selectStationList.add(selectedStation);
      }
    } else {
      showErrorSnackbar("Batas maksimal 3 stasiun");
    }
    notifyListeners();
  }
}
