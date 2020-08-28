part of 'viewmodels.dart';

class SearchStasiunViewmodel extends FutureViewModel<void> {
  List<SelectedStation> stationList;
  List<SelectedStation> backupStationList;
  TextEditingController queryController = TextEditingController();
  SelectedStation currentStation;

  Function(SelectedStation) onChange;

  SearchStasiunViewmodel(this.onChange, this.currentStation);

  @override
  Future<void> futureToRun() => init();

  Future<void> init() async {
    // Get Station List
    if (await isConnectToInternet()) {
      BaseResponse<List<SelectedStation>> result =
          await _krlService.getStationList();
      
      // Check result
      if (result.status) {
        stationList = result.result;
        backupStationList = stationList;
      } else {
        showErrorSnackbar(result.message);
      }
    } else {
      showErrorSnackbar("Periksa kembali koneksi anda");
    }

    // add Listerner for controller
    queryController.addListener(filterStation);
  }

  void filterStation() {
    stationList = backupStationList;
    List<SelectedStation> tempStationList = [];
    for (int i = 0; i < stationList.length; i++) {
      if (stationList[i]
          .stationName
          .toLowerCase()
          .contains(queryController.text.toLowerCase())) {
        tempStationList.add(stationList[i]);
      }
    }
    stationList = tempStationList;
    notifyListeners();
  }

  void selectStasiun(SelectedStation selectedStation) {
    currentStation = selectedStation;
    notifyListeners();
    onChange(currentStation);
    Navigator.pop(_snackbarKey.currentContext);
  }
}
