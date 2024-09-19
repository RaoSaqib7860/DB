class GetInvontoryModel {
  String? result;
  String? error;
  String? message;
  List<Data>? data;
  int? inStock;
  int? outStock;
  int? total;

  GetInvontoryModel(
      {this.result,
        this.error,
        this.message,
        this.data,
        this.inStock,
        this.outStock,
        this.total});

  GetInvontoryModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    error = json['error'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    inStock = json['in_stock'];
    outStock = json['out_stock'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['in_stock'] = this.inStock;
    data['out_stock'] = this.outStock;
    data['total'] = this.total;
    return data;
  }
}

class Data {
  int? id;
  int? termId;
  int? stockManage;
  int? stockStatus;
  int? stockQty;
  String? sku;
  Term? term;

  Data(
      {this.id,
        this.termId,
        this.stockManage,
        this.stockStatus,
        this.stockQty,
        this.sku,
        this.term});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    termId = json['term_id'];
    stockManage = json['stock_manage'];
    stockStatus = json['stock_status'];
    stockQty = json['stock_qty'];
    sku = json['sku'];
    term = json['term'] != null ? new Term.fromJson(json['term']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['term_id'] = this.termId;
    data['stock_manage'] = this.stockManage;
    data['stock_status'] = this.stockStatus;
    data['stock_qty'] = this.stockQty;
    data['sku'] = this.sku;
    if (this.term != null) {
      data['term'] = this.term!.toJson();
    }
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
  Preview? preview;

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
        this.domainId,
        this.preview});

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
    preview =
    json['preview'] != null ? new Preview.fromJson(json['preview']) : null;
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
    if (this.preview != null) {
      data['preview'] = this.preview!.toJson();
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
