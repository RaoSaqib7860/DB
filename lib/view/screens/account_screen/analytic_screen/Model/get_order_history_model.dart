class GetOrserHistoryModel {
  String? result;
  String? error;
  String? message;
  Data? data;

  GetOrserHistoryModel({this.result, this.error, this.message, this.data});

  GetOrserHistoryModel.fromJson(Map<String, dynamic> json) {
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
  Orders? orders;
  String? start;
  String? end;
  int? total;
  int? completed;
  int? canceled;
  int? proccess;
  int? amounts;
  int? amountCancel;
  int? amountProccess;
  int? amountCompleted;
  Request? request;

  Data(
      {this.orders,
        this.start,
        this.end,
        this.total,
        this.completed,
        this.canceled,
        this.proccess,
        this.amounts,
        this.amountCancel,
        this.amountProccess,
        this.amountCompleted,
        this.request});

  Data.fromJson(Map<String, dynamic> json) {
    orders =
    json['orders'] != null ? new Orders.fromJson(json['orders']) : null;
    start = json['start'];
    end = json['end'];
    total = json['total'];
    completed = json['completed'];
    canceled = json['canceled'];
    proccess = json['proccess'];
    amounts = json['amounts'];
    amountCancel = json['amount_cancel'];
    amountProccess = json['amount_proccess'];
    amountCompleted = json['amount_completed'];
    request =
    json['request'] != null ? new Request.fromJson(json['request']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
      data['orders'] = this.orders!.toJson();
    }
    data['start'] = this.start;
    data['end'] = this.end;
    data['total'] = this.total;
    data['completed'] = this.completed;
    data['canceled'] = this.canceled;
    data['proccess'] = this.proccess;
    data['amounts'] = this.amounts;
    data['amount_cancel'] = this.amountCancel;
    data['amount_proccess'] = this.amountProccess;
    data['amount_completed'] = this.amountCompleted;
    if (this.request != null) {
      data['request'] = this.request!.toJson();
    }
    return data;
  }
}

class Orders {
  int? currentPage;
  List<DataOf>? dataOf;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Orders(
      {this.currentPage,
        this.dataOf,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  Orders.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      dataOf = <DataOf>[];
      json['data'].forEach((v) {
        dataOf!.add(new DataOf.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.dataOf != null) {
      data['data'] = this.dataOf!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class DataOf {
  int? id;
  String? orderNo;
  String? transactionId;
  int? categoryId;
  int? customerId;
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
  Customer? customer;

  DataOf(
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

  DataOf.fromJson(Map<String, dynamic> json) {
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
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
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
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    return data;
  }
}

class Customer {
  int? id;
  String? name;
  String? mobile;
  String? email;
  int? domainId;
  int? createdBy;
  String? createdAt;
  String? updatedAt;

  Customer(
      {this.id,
        this.name,
        this.mobile,
        this.email,
        this.domainId,
        this.createdBy,
        this.createdAt,
        this.updatedAt});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    domainId = json['domain_id'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['domain_id'] = this.domainId;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}

class Request {
  String? userId;
  String? domainId;

  Request({this.userId, this.domainId});

  Request.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    domainId = json['domain_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['domain_id'] = this.domainId;
    return data;
  }
}
