// To parse this JSON data, do
//
//     final visits = visitsFromJson(jsonString);

import 'dart:convert';

List<VisitsModel> visitsFromJson(String str) => List<VisitsModel>.from(json.decode(str).map((x) => VisitsModel.fromJson(x)));

String visitsToJson(List<VisitsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VisitsModel {
  var id;
  var conditions;
  var userid;
  var clientid;
  var delegateid;
  DateTime? dateofvisit;
  var newvisit;
  DateTime? visitsdate;
  var beforeVisitid;
  var vlastenddate;
  var startLat;
  var startLong;
  var textdiffbetvisit;
  var startDate;
  var endLat;
  var endLong;
  var imageendvisit;
  var endDate;
  var vclientcode;
  var visitcaseid;
  var note;
  var clientname;
  var image;
  var governmentname;
  var clientareaname;
  var cases;

  VisitsModel({
    this.id,
    this.conditions,
    this.userid,
    this.clientid,
    this.delegateid,
    this.dateofvisit,
    this.newvisit,
    this.visitsdate,
    this.beforeVisitid,
    this.vlastenddate,
    this.startLat,
    this.startLong,
    this.textdiffbetvisit,
    this.startDate,
    this.endLat,
    this.endLong,
    this.imageendvisit,
    this.endDate,
    this.vclientcode,
    this.visitcaseid,
    this.note,
    this.clientname,
    this.image,
    this.governmentname,
    this.clientareaname,
    this.cases,
  });

  factory VisitsModel.fromJson(Map<String, dynamic> json) => VisitsModel(
    id: json["id"],
    conditions: json["conditions"],
    userid: json["userid"],
    clientid: json["clientid"],
    delegateid: json["delegateid"],
    dateofvisit: DateTime.parse(json["dateofvisit"]),
    newvisit: json["newvisit"],
    visitsdate: DateTime.parse(json["visitsdate"]),
    beforeVisitid: json["before_visitid"],
    vlastenddate: json["vlastenddate"],
    startLat: json["start_lat"],
    startLong: json["start_long"],
    textdiffbetvisit: json["textdiffbetvisit"],
    startDate: json["start_date"],
    endLat: json["end_lat"],
    endLong: json["end_long"],
    imageendvisit: json["imageendvisit"],
    endDate: json["end_date"],
    vclientcode: json["vclientcode"],
    visitcaseid: json["visitcaseid"],
    note: json["note"],
    clientname: json["clientname"],
    image: json["image"],
    governmentname: json["governmentname"],
    clientareaname: json["clientareaname"],
    cases: json["cases"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "conditions": conditions,
    "userid": userid,
    "clientid": clientid,
    "delegateid": delegateid,
    "dateofvisit": "${dateofvisit!.year.toString().padLeft(4, '0')}-${dateofvisit!.month.toString().padLeft(2, '0')}-${dateofvisit!.day.toString().padLeft(2, '0')}",
    "newvisit": newvisit,
    "visitsdate": visitsdate!.toIso8601String(),
    "before_visitid": beforeVisitid,
    "vlastenddate": vlastenddate,
    "start_lat": startLat,
    "start_long": startLong,
    "textdiffbetvisit": textdiffbetvisit,
    "start_date": startDate,
    "end_lat": endLat,
    "end_long": endLong,
    "imageendvisit": imageendvisit,
    "end_date": endDate,
    "vclientcode": vclientcode,
    "visitcaseid": visitcaseid,
    "note": note,
    "clientname": clientname,
    "image": image,
    "governmentname": governmentname,
    "clientareaname": clientareaname,
    "cases": cases,
  };
}
