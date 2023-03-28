// To parse this JSON data, do
//
//     final page = pageFromJson(jsonString);

import 'dart:convert';

Page pageFromJson(String str) => Page.fromJson(json.decode(str));

String pageToJson(Page data) => json.encode(data.toJson());

class Page {
  Page({
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

  factory Page.fromJson(Map<String, dynamic> json) => Page(
    curPage: json["curPage"],
    datas: json["datas"] == null ? [] : List<dynamic>.from(json["datas"]!.map((x) => x)),
    offset: json["offset"],
    over: json["over"],
    pageCount: json["pageCount"],
    size: json["size"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "curPage": curPage,
    "datas": datas == null ? [] : List<dynamic>.from(datas!.map((x) => x)),
    "offset": offset,
    "over": over,
    "pageCount": pageCount,
    "size": size,
    "total": total,
  };
}
