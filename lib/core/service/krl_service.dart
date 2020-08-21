part of 'services.dart';

class KRLService {
  // --------------------
  // Station Name Request
  // --------------------
  Future<Response> getStationList() async {
    return await Dio().get(baseUrl+stationNameList);
  }
}
