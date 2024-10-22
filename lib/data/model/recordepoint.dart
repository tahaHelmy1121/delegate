// To parse this JSON data, do
//
//     final record = recordFromJson(jsonString);

import 'dart:convert';

RecordePoint recordFromJson(String str) => RecordePoint.fromJson(json.decode(str));

String recordToJson(RecordePoint data) => json.encode(data.toJson());

class RecordePoint {
  var status;
  var reason;
  var registernewpointsaleId;

  RecordePoint({
    required this.status,
    required this.reason,
    required this.registernewpointsaleId,
  });

  factory RecordePoint.fromJson(Map<String, dynamic> json) => RecordePoint(
    status: json["status"],
    reason: json["reason"],
    registernewpointsaleId: json["registernewpointsale_id"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "reason": reason,
    "registernewpointsale_id": registernewpointsaleId,
  };
}
