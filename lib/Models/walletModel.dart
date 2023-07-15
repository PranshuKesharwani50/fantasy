// ignore_for_file: file_names

class WalletModel{

  int? minDeposit;
  bool? status;
  int? code;
  WalletInfo? walletInfo;

  WalletModel({
    this.minDeposit,
    this.status,
    this.code,
    this.walletInfo
  });
  
  WalletModel.fromJson(var json){
    minDeposit = json['min_deposit'];
    status = json['status'];
    code = json['code'];
    walletInfo = WalletInfo.fromJson(json['walletInfo']);
  }

  Map<String , dynamic> toJson(){
    return{
      "min_deposit": minDeposit,
      "status": status,
      "code": code,
      "walletInfo": walletInfo,   
    };
  }

}

class WalletInfo{

  String? userId;
  double? bonus;
  int? prizeAmt;
  double? referralAmt;
  double? depositAmt;
  double? withdrawAmt;
  double? freeClips;
  int? refferalFriendsCount;
  int? bankAccountVerified;
  int? documentVerified;
  int? paytmVerified;
  double? walletAmount;
  String? minWithdrawal;
  String? minDeposit;
  AccountVerified? accountVerified;

  WalletInfo({
    this.userId,
    this.bonus,
    this.prizeAmt,
    this.referralAmt,
    this.depositAmt,
    this.withdrawAmt,
    this.freeClips,
    this.refferalFriendsCount,
    this.bankAccountVerified,
    this.documentVerified,
    this.paytmVerified,
    this.walletAmount,
    this.minWithdrawal,
    this.minDeposit,
    this.accountVerified
  });

  WalletInfo.fromJson(var json){
    userId = json['user_id'];
    bonus = json['bonus_amount'];
    prizeAmt = json['prize_amount'];
    referralAmt = double.parse(json['referral_amount'].toString());
    depositAmt = json['deposit_amount'];
    withdrawAmt = double.parse(json['withdraw_amount'].toString());
    freeClips = double.parse(json['free_chips'].toString());
    refferalFriendsCount = json['refferal_friends_count'];
    bankAccountVerified = json['bank_account_verified'];
    documentVerified = json['document_verified'];
    paytmVerified = json['paytm_verified'];
    walletAmount = json['wallet_amount'];
    minWithdrawal = json['min_withdrawal'];
    minDeposit = json['min_deposit'];
    accountVerified = AccountVerified.fromJson(json['is_account_verified']);
  }

  Map<String , dynamic> toJson(){
    return {
      "user_id": userId,
      "bonus_amount": bonus,
      "prize_amount": prizeAmt,
      "referral_amount": referralAmt,
      "deposit_amount": depositAmt,
      "withdraw_amount": walletAmount,
      "free_chips": freeClips,
      "is_account_verified": accountVerified,
      "refferal_friends_count": refferalFriendsCount,
      "bank_account_verified": bankAccountVerified,
      "document_verified": documentVerified,
      "paytm_verified": paytmVerified,
      "wallet_amount": walletAmount,
      "min_withdrawal": minWithdrawal,
      "min_deposit": minDeposit
    };
  }

}

class AccountVerified{

  int? emailVerified;
  int? documentsVerified;
  int? addressVerified;
  int? paytmVerified;

  AccountVerified({
    this.emailVerified,
    this.documentsVerified,
    this.addressVerified,
    this.paytmVerified,
  });

  AccountVerified.fromJson(var json){
    emailVerified = json['email_verified'];
    documentsVerified = json['documents_verified'];
    addressVerified = json['address_verified'];
    paytmVerified = json['paytm_verified'];
  }

  Map<String, dynamic> toJson(){
    return {
      "email_verified": emailVerified,
      "documents_verified": documentsVerified,
      "address_verified": addressVerified,
      "paytm_verified": paytmVerified
    };
  }

}