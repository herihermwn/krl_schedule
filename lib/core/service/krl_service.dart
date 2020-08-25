part of 'services.dart';

class KRLService {
  final dio = new Dio();

  // --------------------
  // Station Name Request
  // --------------------
  Future<BaseResponse<List<SelectedStation>>> getStationList() async {
    BaseResponse<List<SelectedStation>> result =
        BaseResponse<List<SelectedStation>>();

    // Request Http
    Response response = await dio.get(baseUrl + stationNameList);

    // Check result
    if (response.statusCode == 200) {
      result.result = ((response.data as Map<String, dynamic>)["data"] as List)
          .map((x) => SelectedStation.fromJson(x))
          .toList();
      result.status = true;
    } else {
      result.message = FailedResponse.fromJson(response.data).message;
      result.status = false;
    }

    return result;
  }

  // --------------------
  // Station Request
  // --------------------
  Future<BaseResponse<ScheduleStationResponse>> getScheduleStation(
    String station,
    String timeFrom,
    String timeTo,
  ) async {
    BaseResponse<ScheduleStationResponse> result =
        BaseResponse<ScheduleStationResponse>();

    // Request Http
    Response response = await dio.get(
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

    // Check result
    if (response.statusCode == 200) {
      result.result = ScheduleStationResponse.fromJson(response.data);
      result.status = true;
    } else {
      result.message = FailedResponse.fromJson(response.data).message;
      result.status = false;
    }

    return result;
  }
}
