part of '../viewmodels.dart';

class HomeViewmodel extends StreamViewModel<List<ScheduleStationResponse>> {
  List<ScheduleStationResponse> get schedule => data;
  List<SelectedStation> stationList = [];
  bool stationProses = false;
  bool scheduleProses = false;

  @override
  Stream<List<ScheduleStationResponse>> get stream => getScheduleStation();

  Stream<List<ScheduleStationResponse>> getScheduleStation() async* {
    // Get station fav list
    String stringJson = await _sharedPrefService.getFromPref(favStation);
    stationList = (jsonDecode(stringJson) as List<dynamic>)
        .map((x) => SelectedStation.fromJson(x))
        .toList();

    // Looping get schedule every 1 minute
    while (true) {
      scheduleProses = false;
      notifyListeners();
      List<ScheduleStationResponse> listSchedule = [];
      String message;

      String fromTime = DateFormat.Hm().format(DateTime.now());
      String toTimeHour = 1.hours.fromNow().hour.toString().padLeft(2, "0");
      String toTimeMinute = 1.hours.fromNow().minute.toString().padLeft(2, "0");

      for (int i = 0; i < stationList.length; i++) {
        BaseResponse<ScheduleStationResponse> response =
            await _krlService.getScheduleStation(
          stationList[i].stationId,
          fromTime,
          "$toTimeHour:$toTimeMinute",
        );

        if (response.status) {
          listSchedule.add(response.result);
        } else {
          message = response.message;
        }
      }

      if (listSchedule.length == 0) {
        showErrorSnackbar(message);
      }

      stationProses = true;
      scheduleProses = true;
      yield listSchedule;
      await Future.delayed(Duration(seconds: 30));
    }
  }

}
