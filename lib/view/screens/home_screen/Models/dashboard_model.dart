class DashBoardModel {
  String? result;
  String? error;
  String? message;
  Data? data;

  DashBoardModel({this.result, this.error, this.message, this.data});

  DashBoardModel.fromJson(Map<String, dynamic> json) {
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
  String? totalEarnings;
  String? totalSales;
  String? storageSize;
  String? todaySaleAmount;
  String? todayOrders;
  String? yesterdaySaleAmount;
  String? lastweekSaleAmount;
  String? lastmonthSaleAmount;
  String? thismonthSaleAmount;
  List<Orders>? orders;
 // List<Null>? earnings;
  int? products;
  int? pages;
  dynamic storageUsed;
  String? planName;
  String? productLimit;
  String? storage;
  String? willExpired;

  Data(
      {this.totalEarnings,
        this.totalSales,
        this.storageSize,
        this.todaySaleAmount,
        this.todayOrders,
        this.yesterdaySaleAmount,
        this.lastweekSaleAmount,
        this.lastmonthSaleAmount,
        this.thismonthSaleAmount,
        this.orders,
        //this.earnings,
        this.products,
        this.pages,
        this.storageUsed,
        this.planName,
        this.productLimit,
        this.storage,
        this.willExpired});

  Data.fromJson(Map<String, dynamic> json) {
    totalEarnings = json['totalEarnings'];
    totalSales = json['totalSales'];
    storageSize = json['storage_size'];
    todaySaleAmount = json['today_sale_amount'];
    todayOrders = json['today_orders'];
    yesterdaySaleAmount = json['yesterday_sale_amount'];
    lastweekSaleAmount = json['lastweek_sale_amount'];
    lastmonthSaleAmount = json['lastmonth_sale_amount'];
    thismonthSaleAmount = json['thismonth_sale_amount'];
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
    // if (json['earnings'] != null) {
    //   earnings = <Null>[];
    //   json['earnings'].forEach((v) {
    //     earnings!.add(new Null.fromJson(v));
    //   });
    // }
    products = json['products'];
    pages = json['pages'];
    storageUsed = json['storage_used'];
    planName = json['plan_name'];
    productLimit = json['product_limit'];
    storage = json['storage'];
    willExpired = json['will_expired'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalEarnings'] = this.totalEarnings;
    data['totalSales'] = this.totalSales;
    data['storage_size'] = this.storageSize;
    data['today_sale_amount'] = this.todaySaleAmount;
    data['today_orders'] = this.todayOrders;
    data['yesterday_sale_amount'] = this.yesterdaySaleAmount;
    data['lastweek_sale_amount'] = this.lastweekSaleAmount;
    data['lastmonth_sale_amount'] = this.lastmonthSaleAmount;
    data['thismonth_sale_amount'] = this.thismonthSaleAmount;
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    // if (this.earnings != null) {
    //   data['earnings'] = this.earnings!.map((v) => v.toJson()).toList();
    // }
    data['products'] = this.products;
    data['pages'] = this.pages;
    data['storage_used'] = this.storageUsed;
    data['plan_name'] = this.planName;
    data['product_limit'] = this.productLimit;
    data['storage'] = this.storage;
    data['will_expired'] = this.willExpired;
    return data;
  }
}

class Orders {
  int? year;
  String? month;
  int? sales;

  Orders({this.year, this.month, this.sales});

  Orders.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    month = json['month'];
    sales = json['sales'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['month'] = this.month;
    data['sales'] = this.sales;
    return data;
  }
}
