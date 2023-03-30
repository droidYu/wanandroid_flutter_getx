import 'package:flutter_nb_net/flutter_net.dart';

class WanResponse<T> extends BaseNetworkModel{
  WanResponse({
    this.data,
    this.errorCode,
    this.errorMsg,
  });

  T? data;
  int? errorCode;
  String? errorMsg;

  factory WanResponse.fromJson(Map<String, dynamic> json) => WanResponse(
    data: json["data"],
    errorCode: json["errorCode"],
    errorMsg: json["errorMsg"],
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "errorCode": errorCode,
    "errorMsg": errorMsg,
  };

  @override
  fromJson(Map<String, dynamic> json) {
  }
}