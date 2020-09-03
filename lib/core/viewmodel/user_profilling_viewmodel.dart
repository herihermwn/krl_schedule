part of 'viewmodels.dart';

class UserProfillingViewmodel extends BaseViewModel {
  List<SelectedStation> selectStationList = [];

  Future<void> navigateToHomePage() async {
    if (selectStationList.length != 0) {
      await _sharedPrefService.saveToPref(
        value: jsonEncode(selectStationList),
        key: selectedStationKey,
      );

      _tempData.saveValue(selectedStationKey, selectStationList);

      await _navigationService.replaceWithTransition(
        HomePage(),
        transition: NavigationTransition.RightToLeftWithFade,
        duration: Duration(milliseconds: 300),
      );
    } else {
      showErrorSnackbar("Anda belum menambahkan stasiun (minimal 1)");
    }
  }

  Future<void> removeItem(int index) async {
    selectStationList.removeAt(index);
    notifyListeners();
  }

  Future<void> addItem() async {
    if (selectStationList.length < 5) {
      cariStasiun();
    } else {
      showErrorSnackbar("Batas maksimal 5 stasiun");
    }
    notifyListeners();
  }

  Future<void> cariStasiun() async {
    _tempData.saveValue(selectedStationKey, selectStationList);

    showCustomSnackbarWithoutVarians(
      message: "",
      titleText: SizedBox(height: 16),
      backgroundColor: whiteColor,
      overlayBlur: 0.1,
      padding: EdgeInsets.all(0),
      boxShadows: boxShadowAbove,
      messageText: SearchStasiun(),
    ).whenComplete(() {
      selectStationList = _tempData.getValue(selectedStationKey);
      notifyListeners();
    });
  }
}
