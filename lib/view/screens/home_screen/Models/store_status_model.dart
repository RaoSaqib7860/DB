class StoreStatusModel {
  String? result;
  String? error;
  String? message;
  Location? location;

  StoreStatusModel({this.result, this.error, this.message, this.location});

  StoreStatusModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    error = json['error'];
    message = json['message'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    return data;
  }
}

class Location {
  dynamic logo;
  dynamic favicon;
  dynamic address;
  dynamic phone;
  dynamic shopName;

  Location({this.logo, this.address, this.phone, this.shopName});

  Location.fromJson(Map<String, dynamic> json) {
    logo = json['logo'];
    favicon = json['favicon'];
    address = json['address'];
    phone = json['phone'];
    shopName = json['store_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['logo'] = this.logo;
    data['favicon'] = this.favicon;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['store_email'] = this.shopName;
    return data;
  }
}
