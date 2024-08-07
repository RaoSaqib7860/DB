class UpdateInventoryProduct {
  String? result;
  String? error;
  String? message;
  Data? data;

  UpdateInventoryProduct({this.result, this.error, this.message, this.data});

  UpdateInventoryProduct.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    error = json['error'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<StockData>? stockData;
  Info? info;

  Data({this.stockData, this.info});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['stockData'] != null) {
      stockData = <StockData>[];
      json['stockData'].forEach((v) {
        stockData!.add(new StockData.fromJson(v));
      });
    }
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stockData != null) {
      data['stockData'] = this.stockData!.map((v) => v.toJson()).toList();
    }
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    return data;
  }
}

class StockData {
  String? colorName;
  String? colorImage;
  int? quantity;

  StockData({this.colorName, this.colorImage, this.quantity});

  StockData.fromJson(Map<String, dynamic> json) {
    colorName = json['color_name'];
    colorImage = json['color_image'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color_name'] = this.colorName;
    data['color_image'] = this.colorImage;
    data['quantity'] = this.quantity;
    return data;
  }
}

class Info {
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
  Stock? stock;

  Info(
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
        this.domainId,
        this.stock});

  Info.fromJson(Map<String, dynamic> json) {
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
    stock = json['stock'] != null ? new Stock.fromJson(json['stock']) : null;
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
    if (this.stock != null) {
      data['stock'] = this.stock!.toJson();
    }
    return data;
  }
}

class Stock {
  int? id;
  int? termId;
  int? stockManage;
  int? stockStatus;
  int? stockQty;
  Null? sku;

  Stock(
      {this.id,
        this.termId,
        this.stockManage,
        this.stockStatus,
        this.stockQty,
        this.sku});

  Stock.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    termId = json['term_id'];
    stockManage = json['stock_manage'];
    stockStatus = json['stock_status'];
    stockQty = json['stock_qty'];
    sku = json['sku'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['term_id'] = this.termId;
    data['stock_manage'] = this.stockManage;
    data['stock_status'] = this.stockStatus;
    data['stock_qty'] = this.stockQty;
    data['sku'] = this.sku;
    return data;
  }
}
