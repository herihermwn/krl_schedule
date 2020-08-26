part of '../models.dart';

class BaseResponse<T> {
  String message;
  bool status;
  T result;

  BaseResponse({
    this.status,
    this.message,
    this.result,
  });
}


class FailedResponse {
  bool status;
  String message;

  FailedResponse({this.status, this.message});

  FailedResponse.fromJson(Map<String, dynamic> json) {
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
