part of 'models.dart';

class SelectedStation {
  String stationId;
  String stationName;
  String reason;

  SelectedStation({this.stationId, this.stationName, this.reason});

  SelectedStation.fromJson(Map<String, dynamic> json) {
    reason = json['reason'];
    stationId = json['station_id'];
    stationName = json['station_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reason'] = this.reason;
    data['station_id'] = this.stationId;
    data['station_name'] = this.stationName;
    return data;
  }

}
