part of 'viewmodels.dart';

class UserProfillingViewmodel extends BaseViewModel {
  List<SelectedStation> selectedStation = [
    SelectedStation(
      stationId: "MRI",
      stationName: "Manggarai",
      reason: "Transit berangkat kerja",
    ),
    SelectedStation(
      stationId: "PSM",
      stationName: "Pasar Minggu",
      reason: "Dekat dengan tempat tinggal",
    ),
    SelectedStation(
      stationId: "KLD",
      stationName: "Klender",
      reason: "Dekat dengan tempat kerja",
    ),
    SelectedStation(
      stationId: "DRN",
      stationName: "Duren Kalibata",
      reason: "Dekat tempat kuliah",
    ),
  ];

  Future<void> navigateToHomePage() async {
    // await _navigationService.replaceWithTransition(
    //   UserProfillingPage(),
    //   transition: NavigationTransition.RightToLeftWithFade,
    //   duration: Duration(milliseconds: 500),
    // );
  }

  Future<void> removeStatiunList(int index) async {
    selectedStation.removeAt(index);
    notifyListeners();
  }

  Future<void> addStatiunList() async {
    notifyListeners();
  }
}
