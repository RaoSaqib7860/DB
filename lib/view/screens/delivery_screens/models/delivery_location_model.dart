class DeliveryLocationModel {
  String? result;
  String? error;
  String? message;
  List<Data>? data;

  DeliveryLocationModel({this.result, this.error, this.message, this.data});

  DeliveryLocationModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? slug;
  String? type;
  Null? pId;
  int? featured;
  int? menuStatus;
  int? isAdmin;
  String? createdAt;
  String? updatedAt;
  int? userId;
  int? topMenu;
  int? domainId;
  int? freeShipping;
  int? childAttributeQty;

  Data(
      {this.id,
        this.name,
        this.slug,
        this.type,
        this.pId,
        this.featured,
        this.menuStatus,
        this.isAdmin,
        this.createdAt,
        this.updatedAt,
        this.userId,
        this.topMenu,
        this.domainId,
        this.freeShipping,
        this.childAttributeQty});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    type = json['type'];
    pId = json['p_id'];
    featured = json['featured'];
    menuStatus = json['menu_status'];
    isAdmin = json['is_admin'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userId = json['user_id'];
    topMenu = json['top_menu'];
    domainId = json['domain_id'];
    freeShipping = json['free_shipping'];
    childAttributeQty = json['child_attribute_qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['type'] = this.type;
    data['p_id'] = this.pId;
    data['featured'] = this.featured;
    data['menu_status'] = this.menuStatus;
    data['is_admin'] = this.isAdmin;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user_id'] = this.userId;
    data['top_menu'] = this.topMenu;
    data['domain_id'] = this.domainId;
    data['free_shipping'] = this.freeShipping;
    data['child_attribute_qty'] = this.childAttributeQty;
    return data;
  }
}
