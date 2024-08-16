class GetStoreInfoModel {
  String? result;
  String? message;
  Data? data;

  GetStoreInfoModel({this.result, this.message, this.data});

  GetStoreInfoModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  ActiveTheme? activeTheme;
  Languages? languages;
  List<dynamic>? myLanguages;
  String? shopName;
  String? shopDescription;
  String? storeEmail;
  String? orderPrefix;
  Currency? currency;
  Location? location;
  String? themeColor;
  String? secondColor;
  String? tax;
  String? local;
  List<dynamic>? socials;
  String? orderReceiveMethod;

  Data(
      {this.activeTheme,
        this.languages,
        this.myLanguages,
        this.shopName,
        this.shopDescription,
        this.storeEmail,
        this.orderPrefix,
        this.currency,
        this.location,
        this.themeColor,
        this.secondColor,
        this.tax,
        this.local,
        this.socials,
        this.orderReceiveMethod});

  Data.fromJson(Map<String, dynamic> json) {
    activeTheme = json['active_theme'] != null
        ? new ActiveTheme.fromJson(json['active_theme'])
        : null;
    languages = json['languages'] != null
        ? new Languages.fromJson(json['languages'])
        : null;
    if (json['my_languages'] != null) {
      myLanguages = json['my_languages'];
      // json['my_languages'].forEach((v) {
      //   myLanguages!.add(new Null.fromJson(v));
      // });
    }
    shopName = json['shop_name'];
    shopDescription = json['shop_description'];
    storeEmail = json['store_email'];
    orderPrefix = json['order_prefix'];
    currency = json['currency'] != null
        ? new Currency.fromJson(json['currency'])
        : null;
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    themeColor = json['theme_color'];
    secondColor = json['second_color'];
    tax = json['tax'];
    local = json['local'];
    if (json['socials'] != null) {
      socials = json['socials'];
      // json['socials'].forEach((v) {
      //   socials!.add(new Null.fromJson(v));
      // });
    }
    orderReceiveMethod = json['order_receive_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.activeTheme != null) {
      data['active_theme'] = this.activeTheme!.toJson();
    }
    if (this.languages != null) {
      data['languages'] = this.languages!.toJson();
    }
    if (this.myLanguages != null) {
      data['my_languages'] = this.myLanguages!.map((v) => v.toJson()).toList();
    }
    data['shop_name'] = this.shopName;
    data['shop_description'] = this.shopDescription;
    data['store_email'] = this.storeEmail;
    data['order_prefix'] = this.orderPrefix;
    if (this.currency != null) {
      data['currency'] = this.currency!.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['theme_color'] = this.themeColor;
    data['second_color'] = this.secondColor;
    data['tax'] = this.tax;
    data['local'] = this.local;
    if (this.socials != null) {
      data['socials'] = this.socials!.map((v) => v.toJson()).toList();
    }
    data['order_receive_method'] = this.orderReceiveMethod;
    return data;
  }
}

class ActiveTheme {
  int? id;
  String? domain;
  int? userplanId;
  String? fullDomain;
  int? status;
  int? type;
  String? willExpire;
  DataOf? dataof;
  int? isTrial;
  int? userId;
  int? templateId;
  int? shopType;
  String? createdAt;
  String? updatedAt;
  int? businessIndustory;
  int? onOff;
  String? country;
  int? category;
  String? email;
  String? afid;
  int? isRefer;
  int? commission;
  String? mobile;
  String? costcenternumber;
  int? paid;
  String? paymentComments;

  ActiveTheme(
      {this.id,
        this.domain,
        this.userplanId,
        this.fullDomain,
        this.status,
        this.type,
        this.willExpire,
        this.dataof,
        this.isTrial,
        this.userId,
        this.templateId,
        this.shopType,
        this.createdAt,
        this.updatedAt,
        this.businessIndustory,
        this.onOff,
        this.country,
        this.category,
        this.email,
        this.afid,
        this.isRefer,
        this.commission,
        this.mobile,
        this.costcenternumber,
        this.paid,
        this.paymentComments});

  ActiveTheme.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    domain = json['domain'];
    userplanId = json['userplan_id'];
    fullDomain = json['full_domain'];
    status = json['status'];
    type = json['type'];
    willExpire = json['will_expire'];
    dataof = json['data'] != null ? new DataOf.fromJson(json['data']) : null;
    isTrial = json['is_trial'];
    userId = json['user_id'];
    templateId = json['template_id'];
    shopType = json['shop_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    businessIndustory = json['business_industory'];
    onOff = json['on_off'];
    country = json['country'];
    category = json['category'];
    email = json['email'];
    afid = json['afid'];
    isRefer = json['is_refer'];
    commission = json['commission'];
    mobile = json['mobile'];
    costcenternumber = json['costcenternumber'];
    paid = json['paid'];
    paymentComments = json['payment_comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['domain'] = this.domain;
    data['userplan_id'] = this.userplanId;
    data['full_domain'] = this.fullDomain;
    data['status'] = this.status;
    data['type'] = this.type;
    data['will_expire'] = this.willExpire;
    if (this.dataof != null) {
      data['data'] = this.dataof!.toJson();
    }
    data['is_trial'] = this.isTrial;
    data['user_id'] = this.userId;
    data['template_id'] = this.templateId;
    data['shop_type'] = this.shopType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['business_industory'] = this.businessIndustory;
    data['on_off'] = this.onOff;
    data['country'] = this.country;
    data['category'] = this.category;
    data['email'] = this.email;
    data['afid'] = this.afid;
    data['is_refer'] = this.isRefer;
    data['commission'] = this.commission;
    data['mobile'] = this.mobile;
    data['costcenternumber'] = this.costcenternumber;
    data['paid'] = this.paid;
    data['payment_comments'] = this.paymentComments;
    return data;
  }
}

class DataOf {
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

  DataOf(
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

  DataOf.fromJson(Map<String, dynamic> json) {
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

class Languages {
  String? en;
  String? ar;
  String? ur;

  Languages({this.en, this.ar, this.ur});

  Languages.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    ar = json['ar'];
    ur = json['ur'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    data['ar'] = this.ar;
    data['ur'] = this.ur;
    return data;
  }
}

class Currency {
  dynamic currencyPosition;
  dynamic currencyName;
  dynamic currencyIcon;

  Currency({this.currencyPosition, this.currencyName, this.currencyIcon});

  Currency.fromJson(Map<String, dynamic> json) {
    currencyPosition = json['currency_position'];
    currencyName = json['currency_name'];
    currencyIcon = json['currency_icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency_position'] = this.currencyPosition;
    data['currency_name'] = this.currencyName;
    data['currency_icon'] = this.currencyIcon;
    return data;
  }
}

class Location {
  String? companyName;
  String? address;
  String? city;
  String? state;
  String? zipCode;
  String? email;
  String? phone;
  String? invoiceDescription;

  Location(
      {this.companyName,
        this.address,
        this.city,
        this.state,
        this.zipCode,
        this.email,
        this.phone,
        this.invoiceDescription});

  Location.fromJson(Map<String, dynamic> json) {
    companyName = json['company_name'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zip_code'];
    email = json['email'];
    phone = json['phone'];
    invoiceDescription = json['invoice_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company_name'] = this.companyName;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip_code'] = this.zipCode;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['invoice_description'] = this.invoiceDescription;
    return data;
  }
}
