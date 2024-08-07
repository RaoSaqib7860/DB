class UpdateProductModel {
  String? result;
  String? error;
  String? message;
  Data? data;

  UpdateProductModel({this.result, this.error, this.message, this.data});

  UpdateProductModel.fromJson(Map<String, dynamic> json) {
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
  Product? product;
  List<int>? categoryIds;
  Value? content;

  Data({this.product, this.categoryIds, this.content});

  Data.fromJson(Map<String, dynamic> json) {
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    categoryIds = json['category_ids'].cast<int>();
    content =
    json['content'] != null ? new Value.fromJson(json['content']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['category_ids'] = this.categoryIds;
    if (this.content != null) {
      data['content'] = this.content!.toJson();
    }
    return data;
  }
}

class Product {
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
  Value? content;
  List<PostCategories>? postCategories;
  dynamic affiliate;

  Product(
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
        this.content,
        this.postCategories,
        this.affiliate});

  Product.fromJson(Map<String, dynamic> json) {
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
    content =
    json['content'] != null ? new Value.fromJson(json['content']) : null;
    if (json['post_categories'] != null) {
      postCategories = <PostCategories>[];
      json['post_categories'].forEach((v) {
        postCategories!.add(new PostCategories.fromJson(v));
      });
    }
    affiliate = json['affiliate'];
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
    if (this.content != null) {
      data['content'] = this.content!.toJson();
    }
    if (this.postCategories != null) {
      data['post_categories'] =
          this.postCategories!.map((v) => v.toJson()).toList();
    }
    data['affiliate'] = this.affiliate;
    return data;
  }
}

class Content {
  int? id;
  int? termId;
  String? key;
  Value? value;

  Content({this.id, this.termId, this.key, this.value});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    termId = json['term_id'];
    key = json['key'];
    value = json['value'] != null ? new Value.fromJson(json['value']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['term_id'] = this.termId;
    data['key'] = this.key;
    if (this.value != null) {
      data['value'] = this.value!.toJson();
    }
    return data;
  }
}

class Value {
  String? content;
  String? excerpt;

  Value({this.content, this.excerpt});

  Value.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    excerpt = json['excerpt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    data['excerpt'] = this.excerpt;
    return data;
  }
}

class PostCategories {
  int? categoryId;
  int? termId;

  PostCategories({this.categoryId, this.termId});

  PostCategories.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    termId = json['term_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['term_id'] = this.termId;
    return data;
  }
}
