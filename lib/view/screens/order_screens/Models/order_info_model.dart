class OrderInfoModel {
  String? result;
  String? error;
  String? message;
  OrderData? orderData;
  TCS? tcsData;

  OrderInfoModel(
      {this.result, this.error, this.message, this.orderData, this.tcsData});

  OrderInfoModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    error = json['error'];
    message = json['message'];
    orderData = json['order_data'] != null
        ? new OrderData.fromJson(json['order_data'])
        : null;
    tcsData =
        json['tcs_data'] != null ? new TCS.fromJson(json['tcs_data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.orderData != null) {
      data['order_data'] = this.orderData!.toJson();
    }
    data['tcs_data'] = this.tcsData;
    return data;
  }
}

class OrderData {
  int? id;
  String? orderNo;
  String? transactionId;
  int? categoryId;
  int? customerId;
  int? userId;
  int? orderType;
  int? paymentStatus;
  String? status;
  int? tax;
  int? shipping;
  int? total;
  String? createdAt;
  String? updatedAt;
  String? mobile;
  int? domainId;
  List<OrderItem>? orderItem;
  Customer? customer;
  OrderContent? orderContent;
  ShippingInfo? shippingInfo;
  City? getway;

  OrderData(
      {this.id,
      this.orderNo,
      this.transactionId,
      this.categoryId,
      this.customerId,
      this.userId,
      this.orderType,
      this.paymentStatus,
      this.status,
      this.tax,
      this.shipping,
      this.total,
      this.createdAt,
      this.updatedAt,
      this.mobile,
      this.domainId,
      this.orderItem,
      this.customer,
      this.orderContent,
      this.shippingInfo,
      this.getway});

  OrderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNo = json['order_no'];
    transactionId = json['transaction_id'];
    categoryId = json['category_id'];
    customerId = json['customer_id'];
    userId = json['user_id'];
    orderType = json['order_type'];
    paymentStatus = json['payment_status'];
    status = json['status'];
    tax = json['tax'];
    shipping = json['shipping'];
    total = json['total'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    mobile = json['mobile'];
    domainId = json['domain_id'];
    if (json['order_item'] != null) {
      orderItem = <OrderItem>[];
      json['order_item'].forEach((v) {
        orderItem!.add(new OrderItem.fromJson(v));
      });
    }
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    orderContent = json['order_content'] != null
        ? new OrderContent.fromJson(json['order_content'])
        : null;
    shippingInfo = json['shipping_info'] != null
        ? new ShippingInfo.fromJson(json['shipping_info'])
        : null;
    getway = json['getway'] != null ? new City.fromJson(json['getway']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_no'] = this.orderNo;
    data['transaction_id'] = this.transactionId;
    data['category_id'] = this.categoryId;
    data['customer_id'] = this.customerId;
    data['user_id'] = this.userId;
    data['order_type'] = this.orderType;
    data['payment_status'] = this.paymentStatus;
    data['status'] = this.status;
    data['tax'] = this.tax;
    data['shipping'] = this.shipping;
    data['total'] = this.total;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['mobile'] = this.mobile;
    data['domain_id'] = this.domainId;
    if (this.orderItem != null) {
      data['order_item'] = this.orderItem!.map((v) => v.toJson()).toList();
    }
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.orderContent != null) {
      data['order_content'] = this.orderContent!.toJson();
    }
    if (this.shippingInfo != null) {
      data['shipping_info'] = this.shippingInfo!.toJson();
    }
    if (this.getway != null) {
      data['getway'] = this.getway!.toJson();
    }
    return data;
  }
}

class OrderItem {
  int? id;
  int? orderId;
  int? termId;
  Info? info;
  int? qty;
  int? amount;
  Term? term;

  OrderItem(
      {this.id,
      this.orderId,
      this.termId,
      this.info,
      this.qty,
      this.amount,
      this.term});

  OrderItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    termId = json['term_id'];
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
    qty = json['qty'];
    amount = json['amount'];
    term = json['term'] != null ? new Term.fromJson(json['term']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['term_id'] = this.termId;
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    data['qty'] = this.qty;
    data['amount'] = this.amount;
    if (this.term != null) {
      data['term'] = this.term!.toJson();
    }
    return data;
  }
}

class Info {
  List<AttributeOuter>? attributeOuter;
  List<Options>? options;

  Info({this.attributeOuter, this.options});

  Info.fromJson(Map<String, dynamic> json) {
    if (json['attribute'] != null) {
      attributeOuter = <AttributeOuter>[];
      json['attribute'].forEach((v) {
        attributeOuter!.add(new AttributeOuter.fromJson(v));
      });
    }
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(new Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.attributeOuter != null) {
      data['attribute'] = this.attributeOuter!.map((v) => v.toJson()).toList();
    }
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AttributeOuter {
  int? id;
  int? categoryId;
  int? variationId;
  int? termId;
  Attribute? attribute;
  Attribute? variation;

  AttributeOuter(
      {this.id,
      this.categoryId,
      this.variationId,
      this.termId,
      this.attribute,
      this.variation});

  AttributeOuter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    variationId = json['variation_id'];
    termId = json['term_id'];
    attribute = json['attribute'] != null
        ? new Attribute.fromJson(json['attribute'])
        : null;
    variation = json['variation'] != null
        ? new Attribute.fromJson(json['variation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['variation_id'] = this.variationId;
    data['term_id'] = this.termId;
    if (this.attribute != null) {
      data['attribute'] = this.attribute!.toJson();
    }
    if (this.variation != null) {
      data['variation'] = this.variation!.toJson();
    }
    return data;
  }
}

class Attribute {
  int? id;
  String? name;

  Attribute({this.id, this.name});

  Attribute.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Options {
  int? id;
  int? userId;
  int? termId;
  String? name;
  int? type;
  int? amount;
  int? amountType;
  int? isRequired;
  int? selectType;
  int? pId;

  Options(
      {this.id,
      this.userId,
      this.termId,
      this.name,
      this.type,
      this.amount,
      this.amountType,
      this.isRequired,
      this.selectType,
      this.pId});

  Options.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    termId = json['term_id'];
    name = json['name'];
    type = json['type'];
    amount = json['amount'];
    amountType = json['amount_type'];
    isRequired = json['is_required'];
    selectType = json['select_type'];
    pId = json['p_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['term_id'] = this.termId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['amount'] = this.amount;
    data['amount_type'] = this.amountType;
    data['is_required'] = this.isRequired;
    data['select_type'] = this.selectType;
    data['p_id'] = this.pId;
    return data;
  }
}

class Term {
  int? id;
  String? title;
  String? slug;
  int? userId;
  int? status;
  int? featured;
  String? type;
  int? isAdmin;
  String? createdAt;
  String? updatedAt;
  int? domainId;

  Term(
      {this.id,
      this.title,
      this.slug,
      this.userId,
      this.status,
      this.featured,
      this.type,
      this.isAdmin,
      this.createdAt,
      this.updatedAt,
      this.domainId});

  Term.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    userId = json['user_id'];
    status = json['status'];
    featured = json['featured'];
    type = json['type'];
    isAdmin = json['is_admin'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    domainId = json['domain_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['featured'] = this.featured;
    data['type'] = this.type;
    data['is_admin'] = this.isAdmin;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['domain_id'] = this.domainId;
    return data;
  }
}

class Customer {
  int? id;
  String? name;
  String? mobile;
  String? email;
  int? domainId;
  int? createdBy;
  String? createdAt;
  String? updatedAt;

  Customer(
      {this.id,
      this.name,
      this.mobile,
      this.email,
      this.domainId,
      this.createdBy,
      this.createdAt,
      this.updatedAt});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    domainId = json['domain_id'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['domain_id'] = this.domainId;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class OrderContent {
  int? id;
  int? orderId;
  String? key;
  Value? value;

  OrderContent({this.id, this.orderId, this.key, this.value});

  OrderContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    key = json['key'];
    value = json['value'] != null ? new Value.fromJson(json['value']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['key'] = this.key;
    if (this.value != null) {
      data['value'] = this.value!.toJson();
    }
    return data;
  }
}

class Value {
  String? name;
  String? email;
  String? phone;
  dynamic comment;
  String? address;
  String? zipCode;
  String? couponDiscount;
  String? subTotal;

  Value(
      {this.name,
      this.email,
      this.phone,
      this.comment,
      this.address,
      this.zipCode,
      this.couponDiscount,
      this.subTotal});

  Value.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    comment = json['comment'];
    address = json['address'];
    zipCode = json['zip_code'];
    couponDiscount = json['coupon_discount'];
    subTotal = json['sub_total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['comment'] = this.comment;
    data['address'] = this.address;
    data['zip_code'] = this.zipCode;
    data['coupon_discount'] = this.couponDiscount;
    data['sub_total'] = this.subTotal;
    return data;
  }
}

class ShippingInfo {
  int? orderId;
  int? locationId;
  int? shippingId;
  City? city;
  City? shippingMethod;

  ShippingInfo(
      {this.orderId,
      this.locationId,
      this.shippingId,
      this.city,
      this.shippingMethod});

  ShippingInfo.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    locationId = json['location_id'];
    shippingId = json['shipping_id'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    shippingMethod = json['shipping_method'] != null
        ? new City.fromJson(json['shipping_method'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['location_id'] = this.locationId;
    data['shipping_id'] = this.shippingId;
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    if (this.shippingMethod != null) {
      data['shipping_method'] = this.shippingMethod!.toJson();
    }
    return data;
  }
}

class City {
  int? id;
  String? name;
  String? slug;
  String? type;
  dynamic pId;
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

  City(
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

  City.fromJson(Map<String, dynamic> json) {
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

class TCS {
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

  TCS(
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

  TCS.fromJson(Map<String, dynamic> json) {
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
