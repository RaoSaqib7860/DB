class DeliveryCostModel {
  String? result;
  String? error;
  String? message;
  List<Data>? data;

  DeliveryCostModel({this.result, this.error, this.message, this.data});

  DeliveryCostModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    error = json['error'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? price;
  String? date;
  List<Relations>? relations;

  Data({this.id, this.name, this.price, this.relations,this.date});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    date = json['date'];
    if (json['relations'] != null) {
      relations = <Relations>[];
      json['relations'].forEach((v) {
        relations!.add(new Relations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['date'] = this.date;
    if (this.relations != null) {
      data['relations'] = this.relations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Relations {
  int? relationId;
  String? name;

  Relations({this.relationId, this.name});

  Relations.fromJson(Map<String, dynamic> json) {
    relationId = json['relation_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['relation_id'] = this.relationId;
    data['name'] = this.name;
    return data;
  }
}
