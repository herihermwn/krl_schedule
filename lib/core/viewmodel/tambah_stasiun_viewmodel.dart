part of 'viewmodels.dart';

class TambahStasiunViewmodel extends BaseViewModel {
  SelectedStation selectedStation;
  TextEditingController stasiunController = TextEditingController();
  TextEditingController alasanController = TextEditingController();

  Future<void> cariStasiun() async {
    showCustomSnackbarWithoutVarians(
      message: "",
      titleText: SizedBox(),
      backgroundColor: whiteColor,
      overlayBlur: 0.1,
      padding: EdgeInsets.all(0),
      boxShadows: boxShadowAbove,
      messageText: SearchStasiun(
        onChange: setStation,
        currentStation: selectedStation,
      ),
    ).whenComplete(() {
      if (selectedStation != null) {
        stasiunController.text = selectedStation.stationName;
      }
    });
  }

  void setStation(SelectedStation selectedStation) {
    this.selectedStation = selectedStation;
  }

  bool checkInput() {
    if (alasanController.text.length == 0 || selectedStation == null) {
      showErrorSnackbar("Periksa input kembali");
      return false;
    } else {
      return true;
    }
  }

  Future<void> tambahkanStasiun() async {
    if (checkInput()) {
      _navigationService.back(
        result: SelectedStation(
          reason: alasanController.text.trim(),
          stationId: selectedStation.stationId,
          stationName: selectedStation.stationName,
        ),
      );
    }
  }
}
