class GetAnalyticsModel {
  String? result;
  String? error;
  String? message;
  Data? data;

  GetAnalyticsModel({this.result, this.error, this.message, this.data});

  GetAnalyticsModel.fromJson(Map<String, dynamic> json) {
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
  bool? url;
  Browsers? browsers;
  List<Pages>? pages;
  int? vistors;
  dynamic totalTimeSpent;
  int? uniqueVistors;
  List<Cities>? cities;
  Regions? regions;

  Data(
      {this.url,
      this.browsers,
      this.pages,
      this.vistors,
      this.totalTimeSpent,
      this.uniqueVistors,
      this.cities,
      this.regions});

  Data.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    browsers = json['browsers'] != null
        ? new Browsers.fromJson(json['browsers'])
        : null;
    if (json['pages'] != null) {
      pages = <Pages>[];
      json['pages'].forEach((v) {
        pages!.add(new Pages.fromJson(v));
      });
    }
    vistors = json['vistors'];
    totalTimeSpent = json['total_time_spent'];
    uniqueVistors = json['unique_vistors'];
    if (json['cities'] != null) {
      cities = <Cities>[];
      json['cities'].forEach((v) {
        cities!.add(new Cities.fromJson(v));
      });
    }
    regions =
        json['regions'] != null ? new Regions.fromJson(json['regions']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    if (this.browsers != null) {
      data['browsers'] = this.browsers!.toJson();
    }
    if (this.pages != null) {
      data['pages'] = this.pages!.map((v) => v.toJson()).toList();
    }
    data['vistors'] = this.vistors;
    data['total_time_spent'] = this.totalTimeSpent;
    data['unique_vistors'] = this.uniqueVistors;
    if (this.cities != null) {
      data['cities'] = this.cities!.map((v) => v.toJson()).toList();
    }
    if (this.regions != null) {
      data['regions'] = this.regions!.toJson();
    }
    return data;
  }
}

class Browsers {
  int? firefox;
  int? chrome;
  int? safari;
  int? edge;
  int? brave;
  int? opera;
  int? others;

  Browsers(
      {this.firefox,
      this.chrome,
      this.safari,
      this.edge,
      this.brave,
      this.opera,
      this.others});

  Browsers.fromJson(Map<String, dynamic> json) {
    firefox = json['firefox'];
    chrome = json['chrome'];
    safari = json['safari'];
    edge = json['edge'];
    brave = json['brave'];
    opera = json['opera'];
    others = json['others'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firefox'] = this.firefox;
    data['chrome'] = this.chrome;
    data['safari'] = this.safari;
    data['edge'] = this.edge;
    data['brave'] = this.brave;
    data['opera'] = this.opera;
    data['others'] = this.others;
    return data;
  }
}

class Pages {
  String? url;
  int? viewCount;

  Pages({this.url, this.viewCount});

  Pages.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    viewCount = json['view_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['view_count'] = this.viewCount;
    return data;
  }
}

class Cities {
  String? city;
  int? viewCount;

  Cities({this.city, this.viewCount});

  Cities.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    viewCount = json['view_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['view_count'] = this.viewCount;
    return data;
  }
}

class Regions {
  int? punjab;
  int? islamabad;
  int? sindh;
  int? balochistan;
  int? kpk;
  int? azadJammuKashmir;
  int? fata;
  int? gilgitBaltistan;

  Regions(
      {this.punjab,
      this.islamabad,
      this.sindh,
      this.balochistan,
      this.kpk,
      this.azadJammuKashmir,
      this.fata,
      this.gilgitBaltistan});

  Regions.fromJson(Map<String, dynamic> json) {
    punjab = json['punjab'];
    islamabad = json['islamabad'];
    sindh = json['sindh'];
    balochistan = json['balochistan'];
    kpk = json['kpk'];
    azadJammuKashmir = json['azad-jammu-kashmir'];
    fata = json['fata'];
    gilgitBaltistan = json['gilgit-baltistan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['punjab'] = this.punjab;
    data['islamabad'] = this.islamabad;
    data['sindh'] = this.sindh;
    data['balochistan'] = this.balochistan;
    data['kpk'] = this.kpk;
    data['azad-jammu-kashmir'] = this.azadJammuKashmir;
    data['fata'] = this.fata;
    data['gilgit-baltistan'] = this.gilgitBaltistan;
    return data;
  }
}
