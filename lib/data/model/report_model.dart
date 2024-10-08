// To parse this JSON data, do
//
//     final customerReportModel = customerReportModelFromJson(jsonString);

import 'dart:convert';

List<CustomerReportModel> customerReportModelFromJson(String str) => List<CustomerReportModel>.from(json.decode(str).map((x) => CustomerReportModel.fromJson(x)));

String customerReportModelToJson(List<CustomerReportModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CustomerReportModel {
  var clientname;
  var clientdebt;
  var debtlimit;
  var residual;
var lastsellbilldate;

  CustomerReportModel({
     this.clientname,
     this.clientdebt,
     this.debtlimit,
     this.residual,
     this.lastsellbilldate,
  });

  factory CustomerReportModel.fromJson(Map<String, dynamic> json) => CustomerReportModel(
    clientname: json["clientname"],
    clientdebt: json["clientdebt"],
    debtlimit: json["debtlimit"],
    residual: json["residual"],
    lastsellbilldate: json["lastsellbilldate"],
  );

  Map<String, dynamic> toJson() => {
    "clientname": clientname,
    "clientdebt": clientdebt,
    "debtlimit": debtlimit,
    "residual": residual,
    "lastsellbilldate": lastsellbilldate,
  };
}
