part of '../viewmodels.dart';

class HomeViewmodel extends StreamViewModel<List<ScheduleStationResponse>> {
  final TickerProvider vsync;
  List<SelectedStation> stationList = [];

  HomeViewmodel(this.vsync, this.stationList);

  List<Widget> tab = [];
  ScrollController scrollViewController;
  TabController tabController;

  // ---------
  // Getter
  // ---------
  List<ScheduleStationResponse> get schedule => data ?? [];

  @override
  void initialise() {
    for (final station in stationList) {
      tab.add(builTab(station.stationName));
    }
    // Initial controller
    scrollViewController = ScrollController();
    tabController = TabController(vsync: vsync, length: stationList.length);
    super.initialise();
  }

  @override
  Stream<List<ScheduleStationResponse>> get stream => getScheduleStation();

  Stream<List<ScheduleStationResponse>> getScheduleStation() async* {
    // Looping get schedule every 20 seconds
    while (true) {
      List<ScheduleStationResponse> listSchedule = [];
      yield listSchedule;

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

      yield listSchedule;
      await Future.delayed(Duration(seconds: 20));
    }
  }

  @override
  void dispose() {
    scrollViewController.dispose();
    tabController.dispose();
    super.dispose();
  }
}
