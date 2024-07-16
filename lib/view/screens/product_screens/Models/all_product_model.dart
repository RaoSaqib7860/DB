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
  int? currentPage;
  int? lastPage;

  Data(
      {this.posts,
        this.actives,
        this.drafts,
        this.incomplete,
        this.trash,
        this.request,
        this.currentPage,
        this.lastPage});

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
    currentPage = json['current_page'];
    lastPage = json['last_page'];
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
    data['current_page'] = this.currentPage;
    data['last_page'] = this.lastPage;
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
  Preview? preview;

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
        this.preview});

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

class Request {
  String? userId;
  String? type;
  String? page;

  Request({this.userId, this.type, this.page});

  Request.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    type = json['type'];
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['type'] = this.type;
    data['page'] = this.page;
    return data;
  }
}
