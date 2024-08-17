class GetSubscriptionOrderHistoryModel {
  String? result;
  String? error;
  String? message;
  List<Data>? data;

  GetSubscriptionOrderHistoryModel(
      {this.result, this.error, this.message, this.data});

  GetSubscriptionOrderHistoryModel.fromJson(Map<String, dynamic> json) {
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
  String? orderNo;
  int? amount;
  int? tax;
  String? trx;
  String? willExpire;
  int? userId;
  int? planId;
  int? categoryId;
  int? status;
  int? paymentStatus;
  String? createdAt;
  String? updatedAt;
  int? jobVerify;
  String? typeP;
  String? ppStatus;
  String? ppRetrievalReferenceNo;
  String? ppAuthCode;
  Plan? plan;
  Category? category;

  Data(
      {this.id,
        this.orderNo,
        this.amount,
        this.tax,
        this.trx,
        this.willExpire,
        this.userId,
        this.planId,
        this.categoryId,
        this.status,
        this.paymentStatus,
        this.createdAt,
        this.updatedAt,
        this.jobVerify,
        this.typeP,
        this.ppStatus,
        this.ppRetrievalReferenceNo,
        this.ppAuthCode,
        this.plan,
        this.category});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNo = json['order_no'];
    amount = json['amount'];
    tax = json['tax'];
    trx = json['trx'];
    willExpire = json['will_expire'];
    userId = json['user_id'];
    planId = json['plan_id'];
    categoryId = json['category_id'];
    status = json['status'];
    paymentStatus = json['payment_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    jobVerify = json['job_verify'];
    typeP = json['type_p'];
    ppStatus = json['pp_Status'];
    ppRetrievalReferenceNo = json['pp_RetrievalReferenceNo'];
    ppAuthCode = json['pp_AuthCode'];
    plan = json['plan'] != null ? new Plan.fromJson(json['plan']) : null;
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_no'] = this.orderNo;
    data['amount'] = this.amount;
    data['tax'] = this.tax;
    data['trx'] = this.trx;
    data['will_expire'] = this.willExpire;
    data['user_id'] = this.userId;
    data['plan_id'] = this.planId;
    data['category_id'] = this.categoryId;
    data['status'] = this.status;
    data['payment_status'] = this.paymentStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['job_verify'] = this.jobVerify;
    data['type_p'] = this.typeP;
    data['pp_Status'] = this.ppStatus;
    data['pp_RetrievalReferenceNo'] = this.ppRetrievalReferenceNo;
    data['pp_AuthCode'] = this.ppAuthCode;
    if (this.plan != null) {
      data['plan'] = this.plan!.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class Plan {
  int? id;
  String? name;
  String? description;
  int? price;
  int? days;
  DataAgain? dataAgain;
  int? status;
  int? customDomain;
  int? featured;
  int? isDefault;
  int? isTrial;
  String? createdAt;
  String? updatedAt;
  int? appStatus;

  Plan(
      {this.id,
        this.name,
        this.description,
        this.price,
        this.days,
        this.dataAgain,
        this.status,
        this.customDomain,
        this.featured,
        this.isDefault,
        this.isTrial,
        this.createdAt,
        this.updatedAt,
        this.appStatus});

  Plan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    days = json['days'];
    dataAgain = json['data'] != null ? new DataAgain.fromJson(json['data']) : null;
    status = json['status'];
    customDomain = json['custom_domain'];
    featured = json['featured'];
    isDefault = json['is_default'];
    isTrial = json['is_trial'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    appStatus = json['app_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['days'] = this.days;
    if (this.dataAgain != null) {
      data['data'] = this.dataAgain!.toJson();
    }
    data['status'] = this.status;
    data['custom_domain'] = this.customDomain;
    data['featured'] = this.featured;
    data['is_default'] = this.isDefault;
    data['is_trial'] = this.isTrial;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['app_status'] = this.appStatus;
    return data;
  }
}

class DataAgain {
  String? productLimit;
  String? customerLimit;
  String? storage;
  String? customDomain;
  String? inventory;
  String? pos;
  String? customerPanel;
  String? pwa;
  String? whatsapp;
  String? liveSupport;
  String? qrCode;
  String? facebookPixel;
  String? customCss;
  String? customJs;
  String? gtm;
  String? locationLimit;
  String? categoryLimit;
  String? brandLimit;
  String? variationLimit;
  String? staffLimit;
  String? googleAnalytics;

  DataAgain(
      {this.productLimit,
        this.customerLimit,
        this.storage,
        this.customDomain,
        this.inventory,
        this.pos,
        this.customerPanel,
        this.pwa,
        this.whatsapp,
        this.liveSupport,
        this.qrCode,
        this.facebookPixel,
        this.customCss,
        this.customJs,
        this.gtm,
        this.locationLimit,
        this.categoryLimit,
        this.brandLimit,
        this.variationLimit,
        this.staffLimit,
        this.googleAnalytics});

  DataAgain.fromJson(Map<String, dynamic> json) {
    productLimit = json['product_limit'];
    customerLimit = json['customer_limit'];
    storage = json['storage'];
    customDomain = json['custom_domain'];
    inventory = json['inventory'];
    pos = json['pos'];
    customerPanel = json['customer_panel'];
    pwa = json['pwa'];
    whatsapp = json['whatsapp'];
    liveSupport = json['live_support'];
    qrCode = json['qr_code'];
    facebookPixel = json['facebook_pixel'];
    customCss = json['custom_css'];
    customJs = json['custom_js'];
    gtm = json['gtm'];
    locationLimit = json['location_limit'];
    categoryLimit = json['category_limit'];
    brandLimit = json['brand_limit'];
    variationLimit = json['variation_limit'];
    staffLimit = json['staff_limit'];
    googleAnalytics = json['google_analytics'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_limit'] = this.productLimit;
    data['customer_limit'] = this.customerLimit;
    data['storage'] = this.storage;
    data['custom_domain'] = this.customDomain;
    data['inventory'] = this.inventory;
    data['pos'] = this.pos;
    data['customer_panel'] = this.customerPanel;
    data['pwa'] = this.pwa;
    data['whatsapp'] = this.whatsapp;
    data['live_support'] = this.liveSupport;
    data['qr_code'] = this.qrCode;
    data['facebook_pixel'] = this.facebookPixel;
    data['custom_css'] = this.customCss;
    data['custom_js'] = this.customJs;
    data['gtm'] = this.gtm;
    data['location_limit'] = this.locationLimit;
    data['category_limit'] = this.categoryLimit;
    data['brand_limit'] = this.brandLimit;
    data['variation_limit'] = this.variationLimit;
    data['staff_limit'] = this.staffLimit;
    data['google_analytics'] = this.googleAnalytics;
    return data;
  }
}

class Category {
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

  Category(
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

  Category.fromJson(Map<String, dynamic> json) {
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
