part of 'viewmodels.dart';

class UserProfillingViewmodel extends BaseViewModel {
  List<SelectedStation> selectStationList = [];

  Future<void> navigateToHomePage() async {
    // await _navigationService.replaceWithTransition(
    //   page(),
    //   transition: NavigationTransition.RightToLeftWithFade,
    //   duration: Duration(milliseconds: 500),
    // );
    notifyListeners();
  }

  Future<void> removeStatiunList(int index) async {
    selectStationList.removeAt(index);
    notifyListeners();
  }

  Future<void> addStatiunList() async {
    if (selectStationList.length < 5) {
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
      showErrorSnackbar("Batas maksimal 5 stasiun");
    }
    notifyListeners();
  }
}
