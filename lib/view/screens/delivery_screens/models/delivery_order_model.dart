class DeliveryOrders {
  String? result;
  String? error;
  String? message;
  List<Data>? data;

  DeliveryOrders({this.result, this.error, this.message, this.data});

  DeliveryOrders.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    error = json['error'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? sellerid;
  int? orderid;
  String? costCenterCode;
  String? consigneeName;
  String? consigneeAddress;
  String? consigneeMobNo;
  String? consigneeEmail;
  String? originCityName;
  String? destinationCityName;
  int? weight;
  int? pieces;
  int? codAmount;
  String? customerReferenceNo;
  int? services;
  String? productDetails;
  String? fragile;
  String? remarks;
  int? insuranceValue;
  String? status;
  String? result;
  String? orderdatetime;
  int? domainId;
  String? productTitle;

  Data(
      {this.id,
        this.sellerid,
        this.orderid,
        this.costCenterCode,
        this.consigneeName,
        this.consigneeAddress,
        this.consigneeMobNo,
        this.consigneeEmail,
        this.originCityName,
        this.destinationCityName,
        this.weight,
        this.pieces,
        this.codAmount,
        this.customerReferenceNo,
        this.services,
        this.productDetails,
        this.fragile,
        this.remarks,
        this.insuranceValue,
        this.status,
        this.result,
        this.orderdatetime,
        this.domainId,
        this.productTitle});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sellerid = json['sellerid'];
    orderid = json['orderid'];
    costCenterCode = json['costCenterCode'];
    consigneeName = json['consigneeName'];
    consigneeAddress = json['consigneeAddress'];
    consigneeMobNo = json['consigneeMobNo'];
    consigneeEmail = json['consigneeEmail'];
    originCityName = json['originCityName'];
    destinationCityName = json['destinationCityName'];
    weight = json['weight'];
    pieces = json['pieces'];
    codAmount = json['codAmount'];
    customerReferenceNo = json['customerReferenceNo'];
    services = json['services'];
    productDetails = json['productDetails'];
    fragile = json['fragile'];
    remarks = json['remarks'];
    insuranceValue = json['insuranceValue'];
    status = json['status'];
    result = json['result'];
    orderdatetime = json['orderdatetime'];
    domainId = json['domain_id'];
    productTitle = json['product_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sellerid'] = this.sellerid;
    data['orderid'] = this.orderid;
    data['costCenterCode'] = this.costCenterCode;
    data['consigneeName'] = this.consigneeName;
    data['consigneeAddress'] = this.consigneeAddress;
    data['consigneeMobNo'] = this.consigneeMobNo;
    data['consigneeEmail'] = this.consigneeEmail;
    data['originCityName'] = this.originCityName;
    data['destinationCityName'] = this.destinationCityName;
    data['weight'] = this.weight;
    data['pieces'] = this.pieces;
    data['codAmount'] = this.codAmount;
    data['customerReferenceNo'] = this.customerReferenceNo;
    data['services'] = this.services;
    data['productDetails'] = this.productDetails;
    data['fragile'] = this.fragile;
    data['remarks'] = this.remarks;
    data['insuranceValue'] = this.insuranceValue;
    data['status'] = this.status;
    data['result'] = this.result;
    data['orderdatetime'] = this.orderdatetime;
    data['domain_id'] = this.domainId;
    data['product_title'] = this.productTitle;
    return data;
  }
}
