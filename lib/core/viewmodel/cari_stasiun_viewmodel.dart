part of 'viewmodels.dart';

class SearchStasiunViewmodel extends FutureViewModel<void> {
  List<SelectedStation> stationList;
  List<SelectedStation> _backupStationList;
  TextEditingController queryController = TextEditingController();
  List<SelectedStation> currentStation;

  SearchStasiunViewmodel();

  @override
  Future<void> futureToRun() => init();

  Future<void> init() async {
    currentStation = _tempData.getValue(selectedStationKey);
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
        Navigator.pop(_snackbarKey.currentContext);
      }
    } else {
      showErrorSnackbar("Periksa kembali koneksi anda");
      Navigator.pop(_snackbarKey.currentContext);
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
  void addItem(SelectedStation selectedStation) {
    if (currentStation.length < 5) {
      currentStation.add(selectedStation);
      notifyListeners();
    } else {
      showErrorSnackbar("Maksimal 5 stasiun");
      Navigator.pop(_snackbarKey.currentContext);
    }
  }

  // action when has item selected
  void removeItem(String id) {
    for (int i = 0; i < currentStation.length; i++) {
      if (id == currentStation[i].stationId) {
        currentStation.removeAt(i);
        notifyListeners();
        break;
      }
    }
  }

  void saveItem() {
    _tempData.updateValue(selectedStationKey, currentStation);
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
