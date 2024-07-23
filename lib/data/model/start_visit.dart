// To parse this JSON data, do
//
//     final startVisit = startVisitFromJson(jsonString);

import 'dart:convert';

StartVisitModel startVisitFromJson(String str) => StartVisitModel.fromJson(json.decode(str));

String startVisitToJson(StartVisitModel data) => json.encode(data.toJson());

class StartVisitModel {
  var status;
  var reason;

  StartVisitModel({
    this.status,
    this.reason,
  });

  factory StartVisitModel.fromJson(Map<String, dynamic> json) => StartVisitModel(
    status: json["status"],
    reason: json["reason"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "reason": reason,
  };
}
