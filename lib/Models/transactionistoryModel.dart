// ignore_for_file: file_names

class TransactionHistoryModel{

  bool? status;
  int? code;
  String? message;
  TransactionHistory? transactionHistory;

  TransactionHistoryModel({
    this.status,
    this.code,
    this.message,
    this.transactionHistory
  });

  TransactionHistoryModel.fromJson(var json){
    status = json['status'];
    code = json['code'];
    message = json['message'];
    transactionHistory = TransactionHistory.fromJson(json['transaction_history']);
  }

  Map<String , dynamic> toJson(){
    return {
      "status": status,
      "code": code,
      "message": message,
      "transaction_history": transactionHistory
    };
  }

}

class TransactionHistory{

  int? userId;
  double? bonusAmt;
  int? prizeAmt;
  int? referralAmt;
  double? depositAmt;
  List<Transaction>? transaction;

  TransactionHistory({
    this.userId,
    this.bonusAmt,
    this.prizeAmt,
    this.referralAmt,
    this.depositAmt,
    this.transaction
  });

  TransactionHistory.fromJson(var json){
    userId = json['user_id'];
    bonusAmt = json['bonus_amount'];
    prizeAmt = json['prize_amount'];
    referralAmt = json['referral_amount'];
    depositAmt = json['deposit_amount'];
    if(json['transaction']!=null){
      final data = List<Map<String , dynamic>>.from(json['transaction']);
      transaction = data.map((e) => Transaction.fromJson(e)).toList();
    }
  }

  Map<String , dynamic> toJson(){
    return {
      "user_id": userId,
      "bonus_amount": bonusAmt,
      "prize_amount": prizeAmt,
      "referral_amount": referralAmt,
      "deposit_amount": depositAmt,
      "transaction": transaction
    };
  }

}

class Transaction{

  String? userId;
  int? amt;
  String? paymentMethod;
  String? transactionId;
  String? paymentType;
  String? paymentStatus;
  String? debitCreditStatus;
  String? date;

  Transaction({
    this.userId,
    this.amt,
    this.paymentMethod,
    this.transactionId,
    this.paymentType,
    this.debitCreditStatus,
    this.date,
    this.paymentStatus
  });

  Transaction.fromJson(var json){
    userId = json['user_id'];
    amt = json['amount'];
    paymentMethod = json['payment_mode'];
    transactionId = json['transaction_id'];
    paymentType = json['payment_type'];
    debitCreditStatus = json['payment_status'];
    date = json['date'];
    paymentStatus = json['payment_status'];
  }

  Map<String , dynamic> toJson(){
    return {
      "user_id": userId,
      "amount": amt,
      "payment_mode": paymentMethod,
      "payment_status": paymentStatus,
      "transaction_id": transactionId,
      "payment_type": paymentType,
      "debit_credit_status": debitCreditStatus,
      "date": date
    };
  }

}