class ProfileModel{

  bool? status;
  int? code;
  String? message;
  String? token;
  UserModel2? userData;

  ProfileModel({
    this.status,
    this.code,
    this.message,
    this.token,
    this.userData
  });

  ProfileModel.fromJson(var json){
    status = json['status'];
    code = json['code'];
    message = json['message'];
    token = json['token'];
    userData = UserModel2.fromJson(json['user_data']);
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

class UserModel2{

  int? id;
  String? name;
  String? userName;
  String? mno;
  String? email;
  int? accountVerified;
  String? referalCode;
  String? profileImg;
  String? teamName;
  String? state;
  String? city;
  String gender = '';
  String dob = '';
  String? userId;
  int? gamePlayed;
  int? totalWinnings;
  int? totalContestJoined;

  UserModel2({
    this.id,
    this.name,
    this.email,
    this.referalCode,
    this.profileImg,
    this.mno,
    this.state,
    this.city,
    gender,
    dob,
    this.teamName,
    this.userName,
    this.userId,
    this.gamePlayed,
    this.totalWinnings,
    this.totalContestJoined
  });

  UserModel2.fromJson(var json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    referalCode = json['referal_code'];
    profileImg = json['profile_image'];
    mno = json['mobile_number'];
    state = json['state'];
    city = json['city'];
    gender = json['gender'].toString();
    dob = json['dateOfBirth'].toString();
    teamName = json['team_name'];
    userName = json['user_name'];
    userId = json['user_id'];
    gamePlayed = json['game_played'];
    totalWinnings = json['total_winnings'];
    totalContestJoined = json['total_contest_joined'];
  }

}