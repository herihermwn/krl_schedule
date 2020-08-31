part of 'viewmodels.dart';

class UserProfillingViewmodel extends BaseViewModel {
  List<SelectedStation> selectStationList = [];

  Future<void> navigateToHomePage() async {
    if (selectStationList.length != 0) {
      await _sharedPrefService.saveToPref(
        value: jsonEncode(selectStationList),
        key: favStation,
      );
      await _navigationService.replaceWithTransition(
        HomePage(selectStationList),
        transition: NavigationTransition.RightToLeftWithFade,
        duration: Duration(milliseconds: 300),
      );
    } else {
      showErrorSnackbar("Anda belum menambahkan stasiun (minimal 1)");
    }
  }

  Future<void> removeStatiunList(int index) async {
    selectStationList.removeAt(index);
    notifyListeners();
  }

  Future<void> addStatiunList() async {
    if (selectStationList.length < 5) {
      cariStasiun();
    } else {
      showErrorSnackbar("Batas maksimal 5 stasiun");
    }
    notifyListeners();
  }

  Future<void> cariStasiun() async {
    showCustomSnackbarWithoutVarians(
      message: "",
      titleText: SizedBox(height: 16),
      backgroundColor: whiteColor,
      overlayBlur: 0.1,
      padding: EdgeInsets.all(0),
      boxShadows: boxShadowAbove,
      messageText: SearchStasiun(
        currentStation: selectStationList,
      ),
    ).whenComplete(() {
      notifyListeners();
    });
  }
}
