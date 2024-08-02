class CateoryProductModel {
  String? result;
  String? error;
  String? message;
  Data? data;

  CateoryProductModel({this.result, this.error, this.message, this.data});

  CateoryProductModel.fromJson(Map<String, dynamic> json) {
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
  List<Categories>? categories;

  Data({this.categories});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  int? featured;
  List<Metas>? metas;
  List<Children>? children;

  Categories({this.id, this.name, this.featured, this.metas, this.children});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    featured = json['featured'];
    if (json['metas'] != null) {
      metas = <Metas>[];
      json['metas'].forEach((v) {
        metas!.add(new Metas.fromJson(v));
      });
    }
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(new Children.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['featured'] = this.featured;
    if (this.metas != null) {
      data['metas'] = this.metas!.map((v) => v.toJson()).toList();
    }
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Metas {
  String? type;
  String? content;

  Metas({this.type, this.content});

  Metas.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['content'] = this.content;
    return data;
  }
}

class Children {
  int? id;
  String? name;
  int? featured;
  dynamic metas;

  Children({this.id, this.name, this.featured, this.metas});

  Children.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    featured = json['featured'];
    featured = json['featured'];
    metas = json['metas'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['featured'] = this.featured;
    data['metas'] = this.metas;
    return data;
  }
}
