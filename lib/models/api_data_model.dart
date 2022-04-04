import 'data_model.dart';

class ApiData {
  ApiData({
    required this.data,
    required this.hasMore,
  });

  List<Datum> data;
  bool hasMore;

  factory ApiData.fromJson(Map<String, dynamic> json) => ApiData(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        hasMore: json["hasMore"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "hasMore": hasMore,
      };
}
