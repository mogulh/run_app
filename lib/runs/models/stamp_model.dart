// To parse this JSON data, do
//
//     final stamp = stampFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Stamp> stampFromJson(String str) =>
    List<Stamp>.from(json.decode(str).map((x) => Stamp.fromJson(x)));

String stampToJson(List<Stamp> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Stamp {
  Stamp({
    required this.id,
    required this.speed,
    required this.distance,
    required this.startAt,
    required this.endAt,
    required this.run,
  });

  int id;
  double speed;
  int distance;
  int startAt;
  int endAt;
  int run;

  factory Stamp.fromJson(Map<String, dynamic> json) => Stamp(
        id: json["id"],
        speed: json["speed"].toDouble(),
        distance: json["distance"],
        startAt: json["start_at"],
        endAt: json["end_at"],
        run: json["run"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "speed": speed,
        "distance": distance,
        "start_at": startAt,
        "end_at": endAt,
        "run": run,
      };
}
