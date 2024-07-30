import 'dart:convert';


List<ClientsModel> ClientsFromJson(String str) => List<ClientsModel>.from(json.decode(str).map((x) => ClientsModel.fromJson(x)));


class ClientsModel {
  var clientid;
  var clientname;
  var clientaddress;
  var clientphone;
  var clientmobile;
  var clientdebt;
  var clientdetails;
  var conditions;
  var clientdate;
  var userid;
  var branchId;
  var clientareaid;
  var clientcode;
  var dailyentryid;
  var rondomtxt;
  var clientStoreIds;
  var obygyPatientId;
  var debtLimit;
  var typeclientid;
  var priceTypeId;
  var lastEditUser;
  var inUse;
  var cardNumber;
  var fileFaida;
  var specialDiscount;
  var specialDiscountVal;
  var file;
  var addDate;
  var mandobCollectRatio;
  var webApiId;
  var clientRFID;
  var linkedSupplierId;
  var postponeDays;
  var studentid;
  var taxnumber;
  var password;
  var clientTypeForTree;
  var treeId;
  var husbandNameObgy;
  var txtNameE;
  var facility;
  var delegate;
  var txtemail;
  var commercial;
  var valtaxnumber;
  var clientaddress2;
  var country;
  var delegateid;
  var datecustomeraccount;
  var vlat;
  var vlong;
  var vimage;

  ClientsModel(
      {this.clientid,
        this.clientname,
        this.clientaddress,
        this.clientphone,
        this.clientmobile,
        this.clientdebt,
        this.clientdetails,
        this.conditions,
        this.clientdate,
        this.userid,
        this.branchId,
        this.clientareaid,
        this.clientcode,
        this.dailyentryid,
        this.rondomtxt,
        this.clientStoreIds,
        this.obygyPatientId,
        this.debtLimit,
        this.typeclientid,
        this.priceTypeId,
        this.lastEditUser,
        this.inUse,
        this.cardNumber,
        this.fileFaida,
        this.specialDiscount,
        this.specialDiscountVal,
        this.file,
        this.addDate,
        this.mandobCollectRatio,
        this.webApiId,
        this.clientRFID,
        this.linkedSupplierId,
        this.postponeDays,
        this.studentid,
        this.taxnumber,
        this.password,
        this.clientTypeForTree,
        this.treeId,
        this.husbandNameObgy,
        this.txtNameE,
        this.facility,
        this.delegate,
        this.txtemail,
        this.commercial,
        this.valtaxnumber,
        this.clientaddress2,
        this.country,
        this.delegateid,
        this.datecustomeraccount,
        this.vlat,
        this.vlong,
        this.vimage});

  ClientsModel.fromJson(Map<String, dynamic> json) {
    clientid = json['clientid'];
    clientname = json['clientname'];
    clientaddress = json['clientaddress'];
    clientphone = json['clientphone'];
    clientmobile = json['clientmobile'];
    clientdebt = json['clientdebt'];
    clientdetails = json['clientdetails'];
    conditions = json['conditions'];
    clientdate = json['clientdate'];
    userid = json['userid'];
    branchId = json['branchId'];
    clientareaid = json['clientareaid'];
    clientcode = json['clientcode'];
    dailyentryid = json['dailyentryid'];
    rondomtxt = json['rondomtxt'];
    clientStoreIds = json['clientStoreIds'];
    obygyPatientId = json['obygyPatientId'];
    debtLimit = json['debtLimit'];
    typeclientid = json['typeclientid'];
    priceTypeId = json['priceTypeId'];
    lastEditUser = json['lastEditUser'];
    inUse = json['inUse'];
    cardNumber = json['card_number'];
    fileFaida = json['file_faida'];
    specialDiscount = json['specialDiscount'];
    specialDiscountVal = json['specialDiscountVal'];
    file = json['file'];
    addDate = json['addDate'];
    mandobCollectRatio = json['mandobCollectRatio'];
    webApiId = json['webApiId'];
    clientRFID = json['clientRFID'];
    linkedSupplierId = json['linkedSupplierId'];
    postponeDays = json['postponeDays'];
    studentid = json['studentid'];
    taxnumber = json['taxnumber'];
    password = json['password'];
    clientTypeForTree = json['clientTypeForTree'];
    treeId = json['treeId'];
    husbandNameObgy = json['husbandNameObgy'];
    txtNameE = json['txtNameE'];
    facility = json['facility'];
    delegate = json['delegate'];
    txtemail = json['txtemail'];
    commercial = json['commercial'];
    valtaxnumber = json['valtaxnumber'];
    clientaddress2 = json['clientaddress2'];
    country = json['country'];
    delegateid = json['delegateid'];
    datecustomeraccount = json['datecustomeraccount'];
    vlat = json['vlat'];
    vlong = json['vlong'];
    vimage = json['vimage'];
  }


}