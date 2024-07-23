class AllOrderModel {
  String? result;
  String? error;
  String? message;
  Data? data;

  AllOrderModel({this.result, this.error, this.message, this.data});

  AllOrderModel.fromJson(Map<String, dynamic> json) {
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
  List<Orders>? orders;
  OrderCounts? orderCounts;

  Data({this.orders, this.orderCounts});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
    orderCounts = json['order_counts'] != null
        ? new OrderCounts.fromJson(json['order_counts'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    if (this.orderCounts != null) {
      data['order_counts'] = this.orderCounts!.toJson();
    }
    return data;
  }
}

class Orders {
  int? id;
  String? orderNo;
  String? transactionId;
  int? categoryId;
  Null? customerId;
  int? userId;
  int? orderType;
  int? paymentStatus;
  String? status;
  int? tax;
  int? shipping;
  int? total;
  String? createdAt;
  String? updatedAt;
  String? mobile;
  int? domainId;
  int? orderItemsCount;
  Null? customer;

  Orders(
      {this.id,
        this.orderNo,
        this.transactionId,
        this.categoryId,
        this.customerId,
        this.userId,
        this.orderType,
        this.paymentStatus,
        this.status,
        this.tax,
        this.shipping,
        this.total,
        this.createdAt,
        this.updatedAt,
        this.mobile,
        this.domainId,
        this.orderItemsCount,
        this.customer});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNo = json['order_no'];
    transactionId = json['transaction_id'];
    categoryId = json['category_id'];
    customerId = json['customer_id'];
    userId = json['user_id'];
    orderType = json['order_type'];
    paymentStatus = json['payment_status'];
    status = json['status'];
    tax = json['tax'];
    shipping = json['shipping'];
    total = json['total'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    mobile = json['mobile'];
    domainId = json['domain_id'];
    orderItemsCount = json['order_items_count'];
    customer = json['customer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_no'] = this.orderNo;
    data['transaction_id'] = this.transactionId;
    data['category_id'] = this.categoryId;
    data['customer_id'] = this.customerId;
    data['user_id'] = this.userId;
    data['order_type'] = this.orderType;
    data['payment_status'] = this.paymentStatus;
    data['status'] = this.status;
    data['tax'] = this.tax;
    data['shipping'] = this.shipping;
    data['total'] = this.total;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['mobile'] = this.mobile;
    data['domain_id'] = this.domainId;
    data['order_items_count'] = this.orderItemsCount;
    data['customer'] = this.customer;
    return data;
  }
}

class OrderCounts {
  int? pending;
  int? processing;
  int? readyForPickup;
  int? completed;
  int? canceled;
  int? archived;

  OrderCounts(
      {this.pending,
        this.processing,
        this.readyForPickup,
        this.completed,
        this.canceled,
        this.archived});

  OrderCounts.fromJson(Map<String, dynamic> json) {
    pending = json['pending'];
    processing = json['processing'];
    readyForPickup = json['ready_for_pickup'];
    completed = json['completed'];
    canceled = json['canceled'];
    archived = json['archived'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pending'] = this.pending;
    data['processing'] = this.processing;
    data['ready_for_pickup'] = this.readyForPickup;
    data['completed'] = this.completed;
    data['canceled'] = this.canceled;
    data['archived'] = this.archived;
    return data;
  }
}