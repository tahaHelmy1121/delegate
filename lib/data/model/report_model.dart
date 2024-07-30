import 'dart:convert';

ReportModel reportModelFromJson(String str) => ReportModel.fromJson(json.decode(str));

class ReportModel {
  Client? client;
  var sellbilltotal;
  var lastsellbilldate;
  List<Clientdebtchanges>? clientdebtchanges;

  ReportModel(
      {this.client,
        this.sellbilltotal,
        this.lastsellbilldate,
        this.clientdebtchanges});

  ReportModel.fromJson(Map<String, dynamic> json) {
    client =
    json['client'] != null ? new Client.fromJson(json['client']) : null;
    sellbilltotal = json['sellbilltotal'];
    lastsellbilldate = json['lastsellbilldate'];
    if (json['clientdebtchanges'] != null) {
      clientdebtchanges = <Clientdebtchanges>[];
      json['clientdebtchanges'].forEach((v) {
        clientdebtchanges!.add(new Clientdebtchanges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    data['sellbilltotal'] = this.sellbilltotal;
    data['lastsellbilldate'] = this.lastsellbilldate;
    if (this.clientdebtchanges != null) {
      data['clientdebtchanges'] =
          this.clientdebtchanges!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Client {
  var clientname;
  var clientphone;
  var clientdetails;
  var clientdebt;
  var debtlimit;
  var residual;

  Client(
      {this.clientname,
        this.clientphone,
        this.clientdetails,
        this.clientdebt,
        this.debtlimit,
        this.residual});

  Client.fromJson(Map<String, dynamic> json) {
    clientname = json['clientname'];
    clientphone = json['clientphone'];
    clientdetails = json['clientdetails'];
    clientdebt = json['clientdebt'];
    debtlimit = json['debtlimit'];
    residual = json['residual'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clientname'] = this.clientname;
    data['clientphone'] = this.clientphone;
    data['clientdetails'] = this.clientdetails;
    data['clientdebt'] = this.clientdebt;
    data['debtlimit'] = this.debtlimit;
    data['residual'] = this.residual;
    return data;
  }
}

class Clientdebtchanges {
  var processname;
  var clientdebtchangeamount;
  var clientdebtchangedate;

  Clientdebtchanges(
      {this.processname,
        this.clientdebtchangeamount,
        this.clientdebtchangedate});

  Clientdebtchanges.fromJson(Map<String, dynamic> json) {
    processname = json['processname'];
    clientdebtchangeamount = json['clientdebtchangeamount'];
    clientdebtchangedate = json['clientdebtchangedate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['processname'] = this.processname;
    data['clientdebtchangeamount'] = this.clientdebtchangeamount;
    data['clientdebtchangedate'] = this.clientdebtchangedate;
    return data;
  }
}