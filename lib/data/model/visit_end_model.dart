// To parse this JSON data, do
//
//     final endVisitModel = endVisitModelFromJson(jsonString);

import 'dart:convert';

EndVisitModel endVisitModelFromJson(String str) => EndVisitModel.fromJson(json.decode(str));

String endVisitModelToJson(EndVisitModel data) => json.encode(data.toJson());

class EndVisitModel {
  var status;
  var reason;

  EndVisitModel({
    this.status,
    this.reason,
  });

  factory EndVisitModel.fromJson(Map<String, dynamic> json) => EndVisitModel(
    status: json["status"],
    reason: json["reason"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "reason": reason,
  };
}
