// To parse this JSON data, do
//
//     final getRegisterNewPoint = getRegisterNewPointFromJson(jsonString);

import 'dart:convert';

List<GetRegisterNewPoint> getRegisterNewPointFromJson(String str) =>
    List<GetRegisterNewPoint>.from(
        json.decode(str).map((x) => GetRegisterNewPoint.fromJson(x)));

String getRegisterNewPointToJson(List<GetRegisterNewPoint> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetRegisterNewPoint {
  var id;
  var recordreg;
  var shopname;
  var contactnumber;
  var shopcat;
  var lat;
  var long;
  var tablesname;
  var clientcode;

  GetRegisterNewPoint({
    required this.id,
    required this.recordreg,
    required this.shopname,
    required this.contactnumber,
    required this.shopcat,
    required this.lat,
    required this.long,
    required this.tablesname,
    required this.clientcode,
  });

  factory GetRegisterNewPoint.fromJson(Map<String, dynamic> json) =>
      GetRegisterNewPoint(
        id: json["id"],
        recordreg: json["recordreg"],
        shopname: json["shopname"],
        contactnumber: json["contactnumber"],
        shopcat: json["shopcat"],
        lat: json["lat"],
        long: json["long"],
        tablesname: json["tablesname"],
        clientcode: json["clientcode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "recordreg": recordreg,
        "shopname": shopname,
        "contactnumber": contactnumber,
        "shopcat": shopcat,
        "lat": lat,
        "long": long,
        "tablesname": tablesname,
        "clientcode": clientcode,
      };
}
