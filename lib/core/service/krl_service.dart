part of 'services.dart';

class KRLService {
  final dio = new Dio();

  // --------------------
  // Station Name Request
  // --------------------
  Future<Response> getStationList() async {
    return await dio.get(baseUrl + stationNameList);
  }

  // --------------------
  // Station Request
  // --------------------
  Future<Response> getScheduleStation(
    String station,
    String timeFrom,
    String timeTo,
  ) async {
    return await dio.get(
      baseUrl + scheduleStation,
      queryParameters: {
        "station": station,
        "time_from": timeFrom,
        "time_to": timeTo
      },
      options: dioOptions.Options(headers: {
        "authorization": apiKey,
      }),
    );
  }
}
