// ignore_for_file: camel_case_types, file_names

class MatchContest{

  bool? sessionExpired;
  int? systemTime;
  String? matchStatus;
  int? matchTime;
  bool? status;
  int? code;
  String? message;
  Responce? responce;

  MatchContest({
    this.sessionExpired,
    this.systemTime,
    this.matchStatus,
    this.matchTime,
    this.status,
    this.code,
    this.message,
    this.responce
  });

  MatchContest.fromJson(var json){
    sessionExpired = json['session_expired'];
    systemTime = json['system_time'];
    matchStatus = json['match_status'];
    matchTime = json['match_time'];
    status = json['status'];
    code = json['code'];
    message = json['message'];
    responce = Responce.fromJson(json['response']);
  }

}

class Responce{

  List<matchContestsData>? matchContests;
  List<myJoinedTeam>? myJoiningTeam;
  List<myJoinedContest>? myjoiningContest;

  Responce({
    this.matchContests,
    this.myJoiningTeam,
    this.myjoiningContest
  });

  Responce.fromJson(var json){
    if(json['matchcontests']!=null){
      final data = List<Map<String , dynamic>>.from(json['matchcontests']);
      matchContests = data.map((e) => matchContestsData.fromJson(e)).toList();
    }
    if(json['myjoinedTeams']!=null){
      final data = List<Map<String , dynamic>>.from(json['myjoinedTeams']);
      myJoiningTeam = data.map((e) => myJoinedTeam.fromJson(e)).toList();
      // myJoiningTeam = json['myjoinedTeams'];
    }
    if(json['myjoinedContest']!=null){
      final data = List<Map<String , dynamic>>.from(json['myjoinedContest']);
      myjoiningContest = data.map((e) => myJoinedContest.fromJson(e)).toList();
      //myjoiningContest = json['myjoinedContest'];
    }
  }

}

class matchContestsData{

  int? contestTypeId;
  String? contestTitle;
  String? contestSubtitle;
  String? tncUrl;
  String? invUrl;
  List<contestsData>? contests;

  matchContestsData({
    this.contestTypeId,
    this.contestTitle,
    this.contestSubtitle,
    this.tncUrl,
    this.invUrl,
    this.contests
  });

  matchContestsData.fromJson(var json){
    contestTypeId = json['contest_type_id'];
    contestTitle = json['contestTitle'];
    contestSubtitle = json['contestSubTitle'];
    tncUrl = json['tnc_url'];
    invUrl = json['inv_url'];
    if(json['contests']!=null){
      final data = List<Map<String , dynamic>>.from(json['contests']);
      contests = data.map((e) => contestsData.fromJson(e)).toList();
    }
  }

}

class contestsData{

  int? contestTypeId;
  bool? isCancelled;
  int? maxTeamAllowed;
  int? usableBonus;
  int? totalSports;
  int? firstPrice;
  int? sortBy;
  int? totalWinningPrice;
  int? extraCash;
  int? contestId;
  int? maxFees;
  int? entryFees;
  int? filledSlot;
  int? winningPercentage;
  int? winnerCount;
  bool? cancellation;

  contestsData({
    this.contestTypeId,
    this.isCancelled,
    this.maxTeamAllowed,
    this.usableBonus,
    this.totalSports,
    this.firstPrice,
    this.sortBy,
    this.totalWinningPrice,
    this.extraCash,
    this.contestId,
    this.maxFees,
    this.entryFees,
    this.filledSlot,
    this.winningPercentage,
    this.winnerCount,
    this.cancellation
  });

  contestsData.fromJson(var json){
    contestTypeId = json['contest_type_id'];
    isCancelled = json['isCancelled'];
    maxTeamAllowed = json['maxAllowedTeam'];
    usableBonus = json['usable_bonus'];
    totalSports = json['totalSpots'];
    firstPrice = json['firstPrice'];
    sortBy = json['sort_by'];
    totalWinningPrice = json['totalWinningPrize'];
    extraCash = json['extra_cash'];
    contestId = json['contestId'];
    maxFees = json['max_fees'];
    entryFees = json['entryFees'];
    filledSlot = json['filledSpots'];
    winningPercentage = json['winnerPercentage'];
    winnerCount = json['winnerCount'];
    cancellation = json['cancellation'];
  }

}

class myJoinedTeam{

  int? teamId;

  myJoinedTeam({
    this.teamId
  });

  myJoinedTeam.fromJson(var json){
    teamId = json['team_id'];
  }

}

class myJoinedContest{

  bool? isCancelled;
  int? maxTeamAllowed;
  int? unableBonus;
  bool? bonusContest;
  int? totalSpots;
  int? firstPrice;
  int? totalWinningPrice;
  String? contestTitle;
  String? contestSubTitle;
  int? contestId;
  int? entryFee;
  int? filledSpots;
  int? winningPercentage;
  int? winnerCount;
  bool? cancellation;
  int? maxEntries;
  List<JoinedTeams>? joinedTeams;

  myJoinedContest({
    isCancelled,
    maxTeamAllowed,
    unableBonus,
    bonusContest,
    totalSpots,
    firstPrice,
    totalWinningPrice,
    contestTitle,
    contestSubTitle,
    contestId,
    entryFee,
    filledSpots,
    winningPercentage,
    winnerCount,
    cancellation,
    maxEntries,
    joinedTeams,
  });

  myJoinedContest.fromJson(var json){
    isCancelled = json['isCancelled'];
    maxTeamAllowed = json['maxAllowedTeam'];
    unableBonus = json['usable_bonus'];
    bonusContest = json['bonus_contest'];
    totalSpots = json['totalSpots'];
    firstPrice = json['firstPrice'];
    totalWinningPrice = json['totalWinningPrize'];
    contestTitle = json['contestTitle'];
    contestSubTitle = json['contestSubTitle'];
    contestId = json['contestId'];
    entryFee = json['entryFees'];
    filledSpots = json['filledSpots'];
    winningPercentage = json['winnerPercentage'];
    winnerCount = json['winnerCount'];
    cancellation = json['cancellation'];
    maxEntries = json['maxEntries'];
    if(json['joinedTeams']!=null){
      final data = List<Map<String , dynamic>>.from(json['joinedTeams']);
      joinedTeams = data.map((e) => JoinedTeams.fromJson(e)).toList();
    }
  }

}

class JoinedTeams{

  String? teamName;
  int? createdTeamId;
  int? contestId;
  bool? isWinning;
  int? rank;
  int? points;
  int? prizeAmount;

  JoinedTeams({
    this.teamName,
    this.points,
    this.rank,
    this.isWinning,
    this.prizeAmount,
    this.contestId,
    this.createdTeamId,
  });

  JoinedTeams.fromJson(var json){
    teamName = json['team_name'];
    points = json['points'];
    rank = json['rank'];
    isWinning = json['isWinning'];
    prizeAmount = json['prize_amount'];
    contestId = json['contestId'];
    createdTeamId = json['createdTeamId'];
  }

}