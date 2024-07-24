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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clientid'] = this.clientid;
    data['clientname'] = this.clientname;
    data['clientaddress'] = this.clientaddress;
    data['clientphone'] = this.clientphone;
    data['clientmobile'] = this.clientmobile;
    data['clientdebt'] = this.clientdebt;
    data['clientdetails'] = this.clientdetails;
    data['conditions'] = this.conditions;
    data['clientdate'] = this.clientdate;
    data['userid'] = this.userid;
    data['branchId'] = this.branchId;
    data['clientareaid'] = this.clientareaid;
    data['clientcode'] = this.clientcode;
    data['dailyentryid'] = this.dailyentryid;
    data['rondomtxt'] = this.rondomtxt;
    data['clientStoreIds'] = this.clientStoreIds;
    data['obygyPatientId'] = this.obygyPatientId;
    data['debtLimit'] = this.debtLimit;
    data['typeclientid'] = this.typeclientid;
    data['priceTypeId'] = this.priceTypeId;
    data['lastEditUser'] = this.lastEditUser;
    data['inUse'] = this.inUse;
    data['card_number'] = this.cardNumber;
    data['file_faida'] = this.fileFaida;
    data['specialDiscount'] = this.specialDiscount;
    data['specialDiscountVal'] = this.specialDiscountVal;
    data['file'] = this.file;
    data['addDate'] = this.addDate;
    data['mandobCollectRatio'] = this.mandobCollectRatio;
    data['webApiId'] = this.webApiId;
    data['clientRFID'] = this.clientRFID;
    data['linkedSupplierId'] = this.linkedSupplierId;
    data['postponeDays'] = this.postponeDays;
    data['studentid'] = this.studentid;
    data['taxnumber'] = this.taxnumber;
    data['password'] = this.password;
    data['clientTypeForTree'] = this.clientTypeForTree;
    data['treeId'] = this.treeId;
    data['husbandNameObgy'] = this.husbandNameObgy;
    data['txtNameE'] = this.txtNameE;
    data['facility'] = this.facility;
    data['delegate'] = this.delegate;
    data['txtemail'] = this.txtemail;
    data['commercial'] = this.commercial;
    data['valtaxnumber'] = this.valtaxnumber;
    data['clientaddress2'] = this.clientaddress2;
    data['country'] = this.country;
    data['delegateid'] = this.delegateid;
    data['datecustomeraccount'] = this.datecustomeraccount;
    data['vlat'] = this.vlat;
    data['vlong'] = this.vlong;
    data['vimage'] = this.vimage;
    return data;
  }
}