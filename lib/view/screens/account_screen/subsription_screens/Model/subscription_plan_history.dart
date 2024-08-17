class GetSubscriptionPlanHistoryModel {
  String? result;
  String? error;
  String? message;
  List<Data>? data;

  GetSubscriptionPlanHistoryModel(
      {this.result, this.error, this.message, this.data});

  GetSubscriptionPlanHistoryModel.fromJson(Map<String, dynamic> json) {
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
  String? description;
  int? price;
  int? days;
  DataNew? dataNew;
  int? status;
  int? customDomain;
  int? featured;
  int? isDefault;
  int? isTrial;
  String? createdAt;
  String? updatedAt;
  int? appStatus;

  Data(
      {this.id,
        this.name,
        this.description,
        this.price,
        this.days,
        this.dataNew,
        this.status,
        this.customDomain,
        this.featured,
        this.isDefault,
        this.isTrial,
        this.createdAt,
        this.updatedAt,
        this.appStatus});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    days = json['days'];
    dataNew = json['data'] != null ? new DataNew.fromJson(json['data']) : null;
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
    if (this.dataNew != null) {
      data['data'] = this.dataNew!.toJson();
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

class DataNew {
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

  DataNew(
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

  DataNew.fromJson(Map<String, dynamic> json) {
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
