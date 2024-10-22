// To parse this JSON data, do
//
//     final registerNewPoint = registerNewPointFromJson(jsonString);

import 'dart:convert';

RegisterNewPoint registerNewPointFromJson(String str) => RegisterNewPoint.fromJson(json.decode(str));

String registerNewPointToJson(RegisterNewPoint data) => json.encode(data.toJson());

class RegisterNewPoint {
  var status;
  var reason;
  var registernewpointsaleId;

  RegisterNewPoint({
    required this.status,
    required this.reason,
    required this.registernewpointsaleId,
  });

  factory RegisterNewPoint.fromJson(Map<String, dynamic> json) => RegisterNewPoint(
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
