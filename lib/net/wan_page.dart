// To parse this JSON data, do
//
//     final page = pageFromJson(jsonString);

class WanPage<T> {
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
  List<T>? datas;
  int? offset;
  bool? over;
  int? pageCount;
  int? size;
  int? total;

  factory WanPage.fromJson(Map<String, dynamic> json,T Function(Map<String, dynamic>) fromMap) => WanPage(
    curPage: json["curPage"],
    datas: json["datas"] == null ? [] : List<T>.from(json["datas"]!.map((x) => fromMap(x))),
    offset: json["offset"],
    over: json["over"],
    pageCount: json["pageCount"],
    size: json["size"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "curPage": curPage,
    "datas": datas == null ? [] : List<T>.from(datas!.map((x) => x)),
    "offset": offset,
    "over": over,
    "pageCount": pageCount,
    "size": size,
    "total": total,
  };
}
