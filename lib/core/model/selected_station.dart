part of 'models.dart';

class SelectedStation {
  String stationId;
  String stationName;

  SelectedStation({this.stationId, this.stationName});

  SelectedStation.fromJson(Map<String, dynamic> json) {
    stationId = json['station_id'];
    stationName = json['station_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['station_id'] = this.stationId;
    data['station_name'] = this.stationName;
    return data;
  }

}
