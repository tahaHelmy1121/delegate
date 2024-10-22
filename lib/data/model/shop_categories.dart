// To parse this JSON data, do
//
//     final shopCategories = shopCategoriesFromJson(jsonString);

import 'dart:convert';

List<ShopCategories> shopCategoriesFromJson(String str) => List<ShopCategories>.from(json.decode(str).map((x) => ShopCategories.fromJson(x)));

String shopCategoriesToJson(List<ShopCategories> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShopCategories {
  var id;
  var visitsdate;
  var conditions;
  var userid;
  var shopcat;

  ShopCategories({
    required this.id,
    required this.visitsdate,
    required this.conditions,
    required this.userid,
    required this.shopcat,
  });

  factory ShopCategories.fromJson(Map<String, dynamic> json) => ShopCategories(
    id: json["id"],
    visitsdate: DateTime.parse(json["visitsdate"]),
    conditions: json["conditions"],
    userid: json["userid"],
    shopcat: json["shopcat"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "visitsdate": visitsdate.toIso8601String(),
    "conditions": conditions,
    "userid": userid,
    "shopcat": shopcat,
  };
}
