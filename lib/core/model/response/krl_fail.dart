part of '../models.dart';

class KrlFailedResponse {
  bool status;
  String message;

  KrlFailedResponse({this.status, this.message});

  KrlFailedResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}
