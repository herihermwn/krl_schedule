part of 'viewmodels.dart';

class SearchStasiunViewmodel extends FutureViewModel<void> {
  List<SelectedStation> stationList;
  List<SelectedStation> _backupStationList;
  TextEditingController queryController = TextEditingController();
  List<SelectedStation> currentStation;

  SearchStasiunViewmodel(this.currentStation);

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
        _backupStationList = stationList;
      } else {
        showErrorSnackbar(result.message);
      }
    } else {
      showErrorSnackbar("Periksa kembali koneksi anda");
    }

    // add Listerner for controller
    queryController.addListener(filterStation);
  }

  // Search station name
  void filterStation() {
    stationList = _backupStationList;
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

  // action when item selected
  void selectStasiun(SelectedStation selectedStation) {
    currentStation.add(selectedStation);
    notifyListeners();
    Navigator.pop(_snackbarKey.currentContext);
  }

  // action when has item selected
  void itemHasSelected() {
    showErrorSnackbar("Stasiun sudah di pilih");
    Navigator.pop(_snackbarKey.currentContext);
  }

  // Check status station
  bool checkStationId(int index) {
    var id = stationList[index].stationId;
    bool isSame = false;
    for (int i = 0; i < currentStation.length; i++) {
      if (id == currentStation[i].stationId) {
        isSame = true;
        break;
      }
    }
    return isSame;
  }
}
