class AllProductModel {
  String? result;
  String? error;
  String? message;
  Data? data;

  AllProductModel({this.result, this.error, this.message, this.data});

  AllProductModel.fromJson(Map<String, dynamic> json) {
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
  List<Posts>? posts;
  int? actives;
  int? drafts;
  int? incomplete;
  int? trash;
  Request? request;
  int? count;

  Data(
      {this.posts,
        this.actives,
        this.drafts,
        this.incomplete,
        this.trash,
        this.request,
        this.count});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
    actives = json['actives'];
    drafts = json['drafts'];
    incomplete = json['incomplete'];
    trash = json['trash'];
    request =
    json['request'] != null ? new Request.fromJson(json['request']) : null;
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    data['actives'] = this.actives;
    data['drafts'] = this.drafts;
    data['incomplete'] = this.incomplete;
    data['trash'] = this.trash;
    if (this.request != null) {
      data['request'] = this.request!.toJson();
    }
    data['count'] = this.count;
    return data;
  }
}

class Posts {
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
  int? orderCount;
  Preview? preview;
  Price? price;
  Stock? stock;

  Posts(
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
        this.orderCount,
        this.preview,
        this.price,
        this.stock});

  Posts.fromJson(Map<String, dynamic> json) {
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
    orderCount = json['order_count'];
    preview =
    json['preview'] != null ? new Preview.fromJson(json['preview']) : null;
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
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
    data['order_count'] = this.orderCount;
    if (this.preview != null) {
      data['preview'] = this.preview!.toJson();
    }
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    if (this.stock != null) {
      data['stock'] = this.stock!.toJson();
    }
    return data;
  }
}

class Preview {
  int? mediaId;
  int? termId;
  Media? media;

  Preview({this.mediaId, this.termId, this.media});

  Preview.fromJson(Map<String, dynamic> json) {
    mediaId = json['media_id'];
    termId = json['term_id'];
    media = json['media'] != null ? new Media.fromJson(json['media']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['media_id'] = this.mediaId;
    data['term_id'] = this.termId;
    if (this.media != null) {
      data['media'] = this.media!.toJson();
    }
    return data;
  }
}

class Media {
  int? id;
  String? url;

  Media({this.id, this.url});

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
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

class Stock {
  int? id;
  int? termId;
  int? stockManage;
  int? stockStatus;
  int? stockQty;
  String? sku;

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

class Request {
  String? userId;
  String? type;

  Request({this.userId, this.type});

  Request.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['type'] = this.type;
    return data;
  }
}
