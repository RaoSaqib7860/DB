class UpdateProductSEOModel {
  String? result;
  String? error;
  String? message;
  Data? data;

  UpdateProductSEOModel({this.result, this.error, this.message, this.data});

  UpdateProductSEOModel.fromJson(Map<String, dynamic> json) {
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
  String? metaTitle;
  String? metaDescription;
  String? metaKeyword;

  Data({this.metaTitle, this.metaDescription, this.metaKeyword});

  Data.fromJson(Map<String, dynamic> json) {
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    metaKeyword = json['meta_keyword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['meta_title'] = this.metaTitle;
    data['meta_description'] = this.metaDescription;
    data['meta_keyword'] = this.metaKeyword;
    return data;
  }
}
