class TCSInformationModel {
  String? result;
  String? error;
  String? message;
  List<Data>? data;

  TCSInformationModel({this.result, this.error, this.message, this.data});

  TCSInformationModel.fromJson(Map<String, dynamic> json) {
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
  int? sellerId;
  String? centerName;
  String? costCenterCode;
  String? pickupAddress;
  String? returnAddress;
  int? printLabel;
  String? accountNumber;
  String? contactNumber;
  String? costCenterCity;
  int? domainId;

  Data(
      {this.id,
        this.sellerId,
        this.centerName,
        this.costCenterCode,
        this.pickupAddress,
        this.returnAddress,
        this.printLabel,
        this.accountNumber,
        this.contactNumber,
        this.costCenterCity,
        this.domainId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sellerId = json['seller_id'];
    centerName = json['center_name'];
    costCenterCode = json['cost_center_code'];
    pickupAddress = json['pickup_address'];
    returnAddress = json['return_address'];
    printLabel = json['print_label'];
    accountNumber = json['account_number'];
    contactNumber = json['contact_number'];
    costCenterCity = json['cost_center_city'];
    domainId = json['domain_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['seller_id'] = this.sellerId;
    data['center_name'] = this.centerName;
    data['cost_center_code'] = this.costCenterCode;
    data['pickup_address'] = this.pickupAddress;
    data['return_address'] = this.returnAddress;
    data['print_label'] = this.printLabel;
    data['account_number'] = this.accountNumber;
    data['contact_number'] = this.contactNumber;
    data['cost_center_city'] = this.costCenterCity;
    data['domain_id'] = this.domainId;
    return data;
  }
}
