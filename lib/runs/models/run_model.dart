// To parse this JSON data, do
//
//     final run = runFromJson(jsonString);

import 'dart:convert';

List<Run> runFromJson(String str) =>
    List<Run>.from(json.decode(str).map((x) => Run.fromJson(x)));

String runToJson(List<Run> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Run {
  Run({
    required this.id,
    required this.speed,
    required this.duration,
    required this.date,
    required this.startAt,
    required this.endAt,
    required this.distance,
    required this.elevation,
    required this.user,
  });

  int id;
  double speed;
  double duration;
  DateTime date;
  DateTime startAt;
  DateTime endAt;
  int distance;
  int elevation;
  int user;

  factory Run.fromJson(Map<String, dynamic> json) => Run(
        id: json["id"],
        speed: json["speed"].toDouble(),
        duration: json["duration"].toDouble(),
        date: DateTime.parse(json["date"]),
        startAt: DateTime.parse(json["start_at"]),
        endAt: DateTime.parse(json["end_at"]),
        distance: json["distance"],
        elevation: json["elevation"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "speed": speed,
        "duration": duration,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "start_at": startAt.toIso8601String(),
        "end_at": endAt.toIso8601String(),
        "distance": distance,
        "elevation": elevation,
        "user": user,
      };
}
