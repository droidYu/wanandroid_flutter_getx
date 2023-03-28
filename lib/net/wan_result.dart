class WanResult<T> {
  WanResult({
    this.data,
    this.errorCode,
    this.errorMsg,
  });

  T? data;
  int? errorCode;
  String? errorMsg;

  factory WanResult.fromJson(Map<String, dynamic> json) => WanResult(
    data: json["data"] == null ? null :json["data"] as T?,
    errorCode: json["errorCode"],
    errorMsg: json["errorMsg"],
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "errorCode": errorCode,
    "errorMsg": errorMsg,
  };
}