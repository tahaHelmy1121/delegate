// To parse this JSON data, do
//
//     final visitsCasess = visitsCasessFromJson(jsonString);

import 'dart:convert';

List<VisitsCasess> visitsCasessFromJson(String str) => List<VisitsCasess>.from(json.decode(str).map((x) => VisitsCasess.fromJson(x)));

String visitsCasessToJson(List<VisitsCasess> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VisitsCasess {
  var id;
  DateTime? visitsdate;
  var conditions;
  var userid;
  var cases;
  var euserid;

  VisitsCasess({
    this.id,
    this.visitsdate,
    this.conditions,
    this.userid,
    this.cases,
    this.euserid,
  });

  factory VisitsCasess.fromJson(Map<String, dynamic> json) => VisitsCasess(
    id: json["id"],
    visitsdate: DateTime.parse(json["visitsdate"]),
    conditions: json["conditions"],
    userid: json["userid"],
    cases: json["cases"],
    euserid: json["euserid"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "visitsdate": visitsdate!.toIso8601String(),
    "conditions": conditions,
    "userid": userid,
    "cases": cases,
    "euserid": euserid,
  };
}
