// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

List<CategoriesModel> categoriesModelFromJson(String str) => List<CategoriesModel>.from(json.decode(str).map((x) => CategoriesModel.fromJson(x)));

String categoriesModelToJson(List<CategoriesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoriesModel {
  var productCatId;
  var productCatName;
  DateTime? productCatDate;
  var productCatDescription;
  var productCatParent;
  var userId;
  var conditions;
  var selldiscount;
  var buydiscount;
  var discounttype;
  var isOptic;
  var buytotal;
  var buyhalf;
  var buypart;
  var buypricereal;
  var opticServices;
  var logo;
  var inMenu;
  var stopNegativeSale;
  var catExcelid;
  var webApiId;

  CategoriesModel({
    required this.productCatId,
    required this.productCatName,
    required this.productCatDate,
    required this.productCatDescription,
    required this.productCatParent,
    required this.userId,
    required this.conditions,
    required this.selldiscount,
    required this.buydiscount,
    required this.discounttype,
    required this.isOptic,
    required this.buytotal,
    required this.buyhalf,
    required this.buypart,
    required this.buypricereal,
    required this.opticServices,
    required this.logo,
    required this.inMenu,
    required this.stopNegativeSale,
    required this.catExcelid,
    required this.webApiId,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
    productCatId: json["productCatId"],
    productCatName: json["productCatName"],
    productCatDate: DateTime.parse(json["productCatDate"]),
    productCatDescription: json["productCatDescription"],
    productCatParent: json["productCatParent"],
    userId: json["userId"],
    conditions: json["conditions"],
    selldiscount: json["selldiscount"],
    buydiscount: json["buydiscount"],
    discounttype: json["discounttype"],
    isOptic: json["isOptic"],
    buytotal: json["buytotal"],
    buyhalf: json["buyhalf"],
    buypart: json["buypart"],
    buypricereal: json["buypricereal"],
    opticServices: json["opticServices"],
    logo: json["logo"],
    inMenu: json["inMenu"],
    stopNegativeSale: json["stopNegativeSale"],
    catExcelid: json["catExcelid"],
    webApiId: json["webApiId"],
  );

  Map<String, dynamic> toJson() => {
    "productCatId": productCatId,
    "productCatName": productCatName,
    "productCatDate": "${productCatDate!.year.toString().padLeft(4, '0')}-${productCatDate!.month.toString().padLeft(2, '0')}-${productCatDate!.day.toString().padLeft(2, '0')}",
    "productCatDescription": productCatDescription,
    "productCatParent": productCatParent,
    "userId": userId,
    "conditions": conditions,
    "selldiscount": selldiscount,
    "buydiscount": buydiscount,
    "discounttype": discounttype,
    "isOptic": isOptic,
    "buytotal": buytotal,
    "buyhalf": buyhalf,
    "buypart": buypart,
    "buypricereal": buypricereal,
    "opticServices": opticServices,
    "logo": logo,
    "inMenu": inMenu,
    "stopNegativeSale": stopNegativeSale,
    "catExcelid": catExcelid,
    "webApiId": webApiId,
  };
}
