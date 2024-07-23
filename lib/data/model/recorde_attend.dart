// To parse this JSON data, do
//
//     final recordattendance = recordattendanceFromJson(jsonString);

import 'dart:convert';

Recordattendance recordattendanceFromJson(String str) => Recordattendance.fromJson(json.decode(str));

class Recordattendance {
  var status;
  var reason;
  var recordattendanceId;

  Recordattendance({
    this.status,
    this.reason,
    this.recordattendanceId,
  });

  factory Recordattendance.fromJson(Map<String, dynamic> json) => Recordattendance(
    status: json["status"],
    reason: json["reason"],
    recordattendanceId: json["recordattendance_id"],
  );


}
