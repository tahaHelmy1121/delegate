// To parse this JSON data, do
//
//     final getClientErea = getClientEreaFromJson(jsonString);

import 'dart:convert';

List<GetClientErea> getClientEreaFromJson(String str) => List<GetClientErea>.from(json.decode(str).map((x) => GetClientErea.fromJson(x)));

String getClientEreaToJson(List<GetClientErea> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetClientErea {
  var id;
  var text;

  GetClientErea({
    required this.id,
    required this.text,
  });

  factory GetClientErea.fromJson(Map<String, dynamic> json) => GetClientErea(
    id: json["id"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "text": text,
  };
}
