class Datum {
  Datum({
    required this.bearing,
    required this.datetime,
    required this.distanceFromLast,
    required this.gpsStatus,
    required this.lat,
    required this.lon,
    required this.speed,
    required this.xAcc,
    required this.yAcc,
    required this.zAcc,
  });

  double bearing;
  DateTime datetime;
  double distanceFromLast;
  String gpsStatus;
  double lat;
  double lon;
  double speed;
  double xAcc;
  double yAcc;
  double zAcc;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        bearing: json["bearing"].toDouble(),
        datetime: DateTime.parse(json["datetime"]),
        distanceFromLast: json["distanceFromLast"].toDouble(),
        gpsStatus: json["gpsStatus"],
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        speed: json["speed"].toDouble(),
        xAcc: json["xAcc"].toDouble(),
        yAcc: json["yAcc"].toDouble(),
        zAcc: json["zAcc"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "bearing": bearing,
        "datetime": datetime.toIso8601String(),
        "distanceFromLast": distanceFromLast,
        "gpsStatus": gpsStatus,
        "lat": lat,
        "lon": lon,
        "speed": speed,
        "xAcc": xAcc,
        "yAcc": yAcc,
        "zAcc": zAcc,
      };
}
