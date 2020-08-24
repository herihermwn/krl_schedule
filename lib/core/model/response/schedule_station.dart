part of '../models.dart';

class ScheduleStationResponse {
  bool status;
  List<Data> data;

  ScheduleStationResponse({this.status, this.data});

  ScheduleStationResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = List<Data>();
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String kaId;
  String kaName;
  String routeName;
  String tujuan;
  String route;
  String stationId;
  String stationName;
  Null remark;
  String stationFinish;
  String waktuTiba;
  String waktu;
  String cImg;
  String cColor;
  String sf;
  String fare;
  String distance;

  Data(
      {this.kaId,
      this.kaName,
      this.routeName,
      this.tujuan,
      this.route,
      this.stationId,
      this.stationName,
      this.remark,
      this.stationFinish,
      this.waktuTiba,
      this.waktu,
      this.cImg,
      this.cColor,
      this.sf,
      this.fare,
      this.distance});

  Data.fromJson(Map<String, dynamic> json) {
    kaId = json['ka_id'];
    kaName = json['ka_name'];
    routeName = json['route_name'];
    tujuan = json['tujuan'];
    route = json['route'];
    stationId = json['station_id'];
    stationName = json['station_name'];
    remark = json['remark'];
    stationFinish = json['station_finish'];
    waktuTiba = json['waktu_tiba'];
    waktu = json['waktu'];
    cImg = json['c_img'];
    cColor = json['c_color'];
    sf = json['sf'];
    fare = json['fare'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ka_id'] = this.kaId;
    data['ka_name'] = this.kaName;
    data['route_name'] = this.routeName;
    data['tujuan'] = this.tujuan;
    data['route'] = this.route;
    data['station_id'] = this.stationId;
    data['station_name'] = this.stationName;
    data['remark'] = this.remark;
    data['station_finish'] = this.stationFinish;
    data['waktu_tiba'] = this.waktuTiba;
    data['waktu'] = this.waktu;
    data['c_img'] = this.cImg;
    data['c_color'] = this.cColor;
    data['sf'] = this.sf;
    data['fare'] = this.fare;
    data['distance'] = this.distance;
    return data;
  }
}
