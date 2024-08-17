class GetSocialLinkModel {
  String? result;
  String? error;
  String? message;
  Data? data;

  GetSocialLinkModel({this.result, this.error, this.message, this.data});

  GetSocialLinkModel.fromJson(Map<String, dynamic> json) {
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
  Socialtype? socialtype;
  int? userid;
  String? updatedAt;
  String? createdAt;
  int? domainId;

  Data(
      {this.id,
        this.socialtype,
        this.userid,
        this.updatedAt,
        this.createdAt,
        this.domainId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    socialtype = json['socialtype'] != null
        ? new Socialtype.fromJson(json['socialtype'])
        : null;
    userid = json['userid'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    domainId = json['domain_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.socialtype != null) {
      data['socialtype'] = this.socialtype!.toJson();
    }
    data['userid'] = this.userid;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['domain_id'] = this.domainId;
    return data;
  }
}

class Socialtype {
  String? facebook;
  String? instagram;
  String? youtube;
  String? twitter;
  String? tiktok;

  Socialtype(
      {this.facebook, this.instagram, this.youtube, this.twitter, this.tiktok});

  Socialtype.fromJson(Map<String, dynamic> json) {
    facebook = json['facebook'];
    instagram = json['instagram'];
    youtube = json['youtube'];
    twitter = json['twitter'];
    tiktok = json['tiktok'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['facebook'] = this.facebook;
    data['instagram'] = this.instagram;
    data['youtube'] = this.youtube;
    data['twitter'] = this.twitter;
    data['tiktok'] = this.tiktok;
    return data;
  }
}
