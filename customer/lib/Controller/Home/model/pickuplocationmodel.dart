// To parse this JSON data, do
//
//     final pickUpLocationModel = pickUpLocationModelFromJson(jsonString);

import 'dart:convert';

PickUpLocationModel pickUpLocationModelFromJson(String str) => PickUpLocationModel.fromJson(json.decode(str));

String pickUpLocationModelToJson(PickUpLocationModel data) => json.encode(data.toJson());

class PickUpLocationModel {
  bool? status;
  String? source;
  int? count;
  List<Result>? result;

  PickUpLocationModel({
    this.status,
    this.source,
    this.count,
    this.result,
  });

  factory PickUpLocationModel.fromJson(Map<String, dynamic> json) => PickUpLocationModel(
    status: json["status"],
    source: json["source"],
    count: json["count"],
    result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "source": source,
    "count": count,
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}

class Result {
  String? name;
  String? postcode;
  double? lat;
  double? lon;

  Result({
    this.name,
    this.postcode,
    this.lat,
    this.lon,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    name: json["name"],
    postcode: json["postcode"],
    lat: json["lat"]?.toDouble(),
    lon: json["lon"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "postcode": postcode,
    "lat": lat,
    "lon": lon,
  };
}
