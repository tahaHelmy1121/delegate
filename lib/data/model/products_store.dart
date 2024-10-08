

import 'dart:convert';

List<ProductsStore> productsStoreFromJson(String str) =>
    List<ProductsStore>.from(
        json.decode(str).map((x) => ProductsStore.fromJson(x)));

class ProductsStore {
  var storedetailid;
  var productid;
  var storeid;
  var productquantity;
  var userid;
  DateTime? storedetaildate;
  var unittype;
  var productName;

  ProductsStore({
    required this.storedetailid,
    required this.productid,
    required this.storeid,
    required this.productquantity,
    required this.userid,
    required this.storedetaildate,
    required this.unittype,
    required this.productName,
  });

  factory ProductsStore.fromJson(Map<String, dynamic> json) => ProductsStore(
        storedetailid: json["storedetailid"],
        productid: json["productid"],
        storeid: json["storeid"],
        productquantity: json["productquantity"],
        userid: json["userid"],
        storedetaildate: DateTime.parse(json["storedetaildate"]),
        unittype: json["unittype"],
        productName: json["productName"],
      );

  Map<String, dynamic> toJson() => {
        "storedetailid": storedetailid,
        "productid": productid,
        "storeid": storeid,
        "productquantity": productquantity,
        "userid": userid,
        "storedetaildate":
            "${storedetaildate!.year.toString().padLeft(4, '0')}-${storedetaildate!.month.toString().padLeft(2, '0')}-${storedetaildate!.day.toString().padLeft(2, '0')}",
        "unittype": unittype,
        "productName": productName,
      };
}
