class OrderIdModel{

  bool? status;
  int? code;
  String? message;
  String? orderId;
  String? cfOrderId;
  int? paymentMode;
  String? paymentSession;
  String? orderExpiryTime;
  CashFreeAppKey? cashFreeApiKey;

  OrderIdModel({
    this.status,
    this.code,
    this.message,
    this.orderId,
    this.cfOrderId,
    this.paymentMode,
    this.paymentSession,
    this.orderExpiryTime,
    this.cashFreeApiKey,
  });

  OrderIdModel.fromJson(var json){
    status = json['status'];
    code = json['code'];
    message = json['message'];
    orderId = json['order_id'];
    cfOrderId = json['cf_order_id'];
    paymentMode = json['payment_mode_type'];
    paymentSession = json['payment_session'];
    orderExpiryTime = json['order_expiry_time'];
    cashFreeApiKey = CashFreeAppKey.fromJson(json['cashfree_app_key']);
  }

}

class CashFreeAppKey{

  int? id;
  String? name;
  String? code;
  int? status;
  String? apiKey;
  String? appSecretKey;
  String? saltIndex;
  String? createdAt;
  String? updatedAt;

  CashFreeAppKey({
    this.id,
    this.name,
    this.code,
    this.status,
    this.apiKey,
    this.appSecretKey,
    this.saltIndex,
    this.createdAt,
    this.updatedAt,
  });

  CashFreeAppKey.fromJson(var json){
    id = json['id'];
    name = json['name'];
    code = json['code'];
    status = json['status'];
    apiKey = json['api_key'];
    appSecretKey = json['api_secret'];
    saltIndex = json['salt_index'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}