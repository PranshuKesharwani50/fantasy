class GameHistoryModel{

bool? status;
int? code;
String? message;
List<GameHistory>? gameHistory;

GameHistoryModel({
  this.status,
  this.message,
  this.code,
  this.gameHistory
});

GameHistoryModel.fromJson(var json){
  status = json['status'];
  message = json['message'];
  code = json['code'];
  if(json['game_history']!=null){
    final data = List<Map<String , dynamic>>.from(json['game_history']);
    gameHistory = data.map((e) => GameHistory.fromJson(e)).toList();
  }
}

}

class GameHistory{

  int? id;
  int? gameId;
  int? userId;
  int? contestId;
  int? gameType;
  int? userType;
  int? rank;
  int? entryFee;
  int? winningAmt;
  int? depositEntryFee;
  int? prizeEntryFee;
  int? gameStatus;
  int? winStatus;
  String? affiliatedUser;
  String? userName;
  String? createdAt;
  String? updatedAt;
  int? filledSpot;
  int? prizePool;
  int? numberOfPlayer;
  String? gameStatusString;
  OpponentUser? opponentUser;
  String? closingBal;

  GameHistory({
    this.id,
    this.gameId,
    this.userId,
    this.contestId,
    this.gameType,
    this.userType,
    this.rank,
    this.entryFee,
    this.winningAmt,
    this.depositEntryFee,
    this.prizeEntryFee,
    this.gameStatus,
    this.winStatus,
    this.affiliatedUser,
    this.userName,
    this.createdAt,
    this.updatedAt,
    this.filledSpot,
    this.prizePool,
    this.numberOfPlayer,
    this.gameStatusString,
    this.opponentUser,
    this.closingBal,
  });

  GameHistory.fromJson(var json){
    id = json['id'];
    gameId = json['game_id'];
    userId = json['user_id'];
    contestId = json['contest_id'];
    gameType = json['game_type'];
    userType = json['user_type'];
    rank = json['ranks'];
    entryFee = json['entry_fees'];
    winningAmt = json['winning_amount'];
    depositEntryFee = json['deposit_entryfees'];
    prizeEntryFee = json['prize_entryfees'];
    gameStatus = json['game_status'];
    winStatus = json['win_status'];
    affiliatedUser = json['affiliated_user'];
    userName = json['user-name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    filledSpot = json['filled_spots'];
    prizePool = json['prize_pool'];
    numberOfPlayer = json['number_of_players'];
    gameStatusString = json['game_status_string'];
    opponentUser = OpponentUser.fromJson(json['opponentUser']);
    closingBal = json['closingBal'];
  }
}

class OpponentUser{

  String? name;
  String? userName;

  OpponentUser({
    this.name,
    this.userName
  });

  OpponentUser.fromJson(var json){
    name = json['name'];
    userName = json['user_name'];
  }

}