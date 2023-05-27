// ignore_for_file: file_names

class LoginResponceModel{
  bool? status;
  int? code;
  String? message;
  String? token;
  UserModel? userData;

  LoginResponceModel({
    this.status,
    this.code,
    this.message,
    this.token,
    this.userData
  });

  factory LoginResponceModel.fromJson(var json){
    return LoginResponceModel(
      status: json['status'],
      code: json['code'],
      message: json['message'],
      token: json['token'],
      userData: UserModel.fromJson(json['user_data'])
    );
  }

  Map<String , dynamic> toJson(){
    return {
      'status': status, 
      'code': code, 
      'message': message, 
      'token': token, 
      'user_data': userData
    };
  }

}


class UserModel{

  String? name;
  String? userName;
  String? mno;
  String? email;
  int? accountVerified;
  String? referalCode;
  String? profileImg;
  String? teamName;
  int? id;
  int? status;

  UserModel({
    this.id,
    this.name,
    this.status,
    this.userName,
    this.mno,
    this.email,
    this.profileImg,
    this.accountVerified,
    this.teamName,
    this.referalCode
  });

  factory UserModel.fromJson(var json){
    return UserModel(
      id : json['id'],
      userName : json['user_name'],
      name : json['name'],
      mno : json['mobile_number'],
      email : json['email'],
      accountVerified : json['is_account_verified'],
      referalCode : json['referal_code'],
      profileImg : json['profile_image'],
      teamName : json['team_name'],
      status : json['status'],
    );
  }

  Map<String , dynamic> toJson(){
    return {
      'name': name, 
      'user_name': userName, 
      'mobile_number': mno, 
      'email': email, 
      'is_account_verified': accountVerified, 
      'referal_code': referalCode, 
      'profile_image': profileImg, 
      'team_name': teamName, 
      'id': id, 
      'status': status
    };
  }

}