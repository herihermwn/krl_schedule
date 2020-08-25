part of '../viewmodels.dart';


  // Future<List<ScheduleStationResponse>> getScheduleStation() async {
  //   String stringJson = await _sharedPrefService.getFromPref(favStation);
  //   List<SelectedStation> stationList =
  //       (jsonDecode(stringJson) as List<dynamic>)
  //           .map((x) => SelectedStation.fromJson(x))
  //           .toList();

  //   List<ScheduleStationResponse> listSchedule = [];
  //   String message;

  //   String fromTime = DateFormat.Hm().format(DateTime.now());
  //   String toTimeHour = 1.hours.fromNow().hour.toString().padLeft(2, "0");
  //   String toTimeMinute = 1.hours.fromNow().minute.toString().padLeft(2, "0");

  //   for (int i = 0; i < stationList.length; i++) {
  //     BaseResponse<ScheduleStationResponse> response =
  //         await _krlService.getScheduleStation(
  //       stationList[i].stationId,
  //       fromTime,
  //       "$toTimeHour:$toTimeMinute",
  //     );

  //     if (response.status) {
  //       listSchedule.add(response.result);
  //     } else {
  //       message = response.message;
  //     }
  //   }

  //   if (listSchedule.length == 0) {
  //     showErrorSnackbar(message);
  //   }

  //   return listSchedule;
  // }