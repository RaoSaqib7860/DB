class UpdateProductPriceModel {
  String? result;
  String? error;
  String? message;
  Data? data;

  UpdateProductPriceModel({this.result, this.error, this.message, this.data});

  UpdateProductPriceModel.fromJson(Map<String, dynamic> json) {
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
  Price? price;

  Data(
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
        this.price});

  Data.fromJson(Map<String, dynamic> json) {
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
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
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
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    return data;
  }
}

class Price {
  int? id;
  int? termId;
  int? price;
  int? regularPrice;
  int? specialPrice;
  int? priceType;
  String? startingDate;
  String? endingDate;
  int? pstatus;

  Price(
      {this.id,
        this.termId,
        this.price,
        this.regularPrice,
        this.specialPrice,
        this.priceType,
        this.startingDate,
        this.endingDate,
        this.pstatus});

  Price.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    termId = json['term_id'];
    price = json['price'];
    regularPrice = json['regular_price'];
    specialPrice = json['special_price'];
    priceType = json['price_type'];
    startingDate = json['starting_date'];
    endingDate = json['ending_date'];
    pstatus = json['pstatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['term_id'] = this.termId;
    data['price'] = this.price;
    data['regular_price'] = this.regularPrice;
    data['special_price'] = this.specialPrice;
    data['price_type'] = this.priceType;
    data['starting_date'] = this.startingDate;
    data['ending_date'] = this.endingDate;
    data['pstatus'] = this.pstatus;
    return data;
  }
}
