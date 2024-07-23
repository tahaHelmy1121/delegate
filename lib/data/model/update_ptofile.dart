// To parse this JSON data, do
//
//     final updateProfile = updateProfileFromJson(jsonString);

import 'dart:convert';

UpdateProfile updateProfileFromJson(String str) => UpdateProfile.fromJson(json.decode(str));

String updateProfileToJson(UpdateProfile data) => json.encode(data.toJson());

class UpdateProfile {
  var status;
  var reason;

  UpdateProfile({
    required this.status,
    required this.reason,
  });

  factory UpdateProfile.fromJson(Map<String, dynamic> json) => UpdateProfile(
    status: json["status"],
    reason: json["reason"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "reason": reason,
  };
}
