// To parse this JSON data, do
//
//     final page = pageFromJson(jsonString);

import 'package:flutter_nb_net/flutter_net.dart';

class WanPage extends BaseNetworkModel<WanPage>{
  WanPage({
    this.curPage,
    this.datas,
    this.offset,
    this.over,
    this.pageCount,
    this.size,
    this.total,
  });

  int? curPage;
  List<dynamic>? datas;
  int? offset;
  bool? over;
  int? pageCount;
  int? size;
  int? total;

  Map<String, dynamic> toJson() => {
    "curPage": curPage,
    "datas": datas,
    "offset": offset,
    "over": over,
    "pageCount": pageCount,
    "size": size,
    "total": total,
  };

  @override
  WanPage fromJson(Map<String, dynamic> json) {
    return WanPage(
      curPage: json["curPage"],
      datas: json["datas"] ,
      offset: json["offset"],
      over: json["over"],
      pageCount: json["pageCount"],
      size: json["size"],
      total: json["total"],
    );
  }
}
