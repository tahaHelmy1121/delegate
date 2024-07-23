// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));


class ProfileModel {
  var userid;
  var username;
  var password;
  var usergroupid;
  var employeename;
  DateTime currentdate;
  var conditions;
  var saveid;
  var userstoreid;
  var awardrate;
  var searchinonesave;
  var branchId;
  var question;
  var answer;
  var blockedByLimits;
  var loginip;
  var lastactivetime;
  var directSaveBills;
  var userstoreidDef;
  var deviceType;
  var empid;
  var obygyDoctorId;
  var lang;
  var allowRemoteAccess;
  var allowRemoteAccessMobile;
  var viewclients;
  var viewbills;
  var storeSupervisor;
  var storeSupervisorStores;
  var projectids;
  var bankids;
  var saveids;
  var searchinonestorebalance;
  var storeids;
  var webApiId;
  var closeSavid;
  var charityids;
  var lastendvisit;

  ProfileModel({
    required this.userid,
    required this.username,
    required this.password,
    required this.usergroupid,
    required this.employeename,
    required this.currentdate,
    required this.conditions,
    required this.saveid,
    required this.userstoreid,
    required this.awardrate,
    required this.searchinonesave,
    required this.branchId,
    required this.question,
    required this.answer,
    required this.blockedByLimits,
    required this.loginip,
    required this.lastactivetime,
    required this.directSaveBills,
    required this.userstoreidDef,
    required this.deviceType,
    required this.empid,
    required this.obygyDoctorId,
    required this.lang,
    required this.allowRemoteAccess,
    required this.allowRemoteAccessMobile,
    required this.viewclients,
    required this.viewbills,
    required this.storeSupervisor,
    required this.storeSupervisorStores,
    required this.projectids,
    required this.bankids,
    required this.saveids,
    required this.searchinonestorebalance,
    required this.storeids,
    required this.webApiId,
    required this.closeSavid,
    required this.charityids,
    required this.lastendvisit,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    userid: json["userid"],
    username: json["username"],
    password: json["password"],
    usergroupid: json["usergroupid"],
    employeename: json["employeename"],
    currentdate: DateTime.parse(json["currentdate"]),
    conditions: json["conditions"],
    saveid: json["saveid"],
    userstoreid: json["userstoreid"],
    awardrate: json["awardrate"],
    searchinonesave: json["searchinonesave"],
    branchId: json["branchId"],
    question: json["question"],
    answer: json["answer"],
    blockedByLimits: json["blockedByLimits"],
    loginip: json["loginip"],
    lastactivetime: json["lastactivetime"],
    directSaveBills: json["directSaveBills"],
    userstoreidDef: json["userstoreidDef"],
    deviceType: json["deviceType"],
    empid: json["empid"],
    obygyDoctorId: json["obygyDoctorId"],
    lang: json["lang"],
    allowRemoteAccess: json["allowRemoteAccess"],
    allowRemoteAccessMobile: json["allowRemoteAccessMobile"],
    viewclients: json["viewclients"],
    viewbills: json["viewbills"],
    storeSupervisor: json["storeSupervisor"],
    storeSupervisorStores: json["storeSupervisorStores"],
    projectids: json["projectids"],
    bankids: json["bankids"],
    saveids: json["saveids"],
    searchinonestorebalance: json["searchinonestorebalance"],
    storeids: json["storeids"],
    webApiId: json["webApiId"],
    closeSavid: json["closeSavid"],
    charityids: json["charityids"],
    lastendvisit: json["lastendvisit"],
  );


}
