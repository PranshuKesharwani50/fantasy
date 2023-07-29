// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:playon69/Extra/config.dart';

var header = {'Content-Type':'application/json'};

loginUser(String mobile,String password,String userType) async{
  var responce = await http.post(
    Uri.parse(baseApiUrl+'login'),
    headers: header,
    body: json.encode({'mobile_number':mobile,'password':password,'user_type':userType})
  );
  var data = json.decode(responce.body);
  print('login responce = $data');
  return data;
}

getMatches(String token) async{
  var responce = await http.get(
    Uri.parse(baseApiUrl+'getMatch'),
    headers: {
      'Content-Type':'application/json',
      'Accept': 'application/json',
      'Authorization':'Bearer $token'
    }
  );
  var data = json.decode(responce.body);
  print('done');
  return data;
}

signupUser(var value) async{
  var responce = await http.post(
    Uri.parse(baseApiUrl+'signup'),
    headers: header,
    body: json.encode(value)
  );
  var data = json.decode(responce.body);
  print(data);
  return data;
}

verifyOtp(String otp,String token) async{
  var responce = await http.post(
    Uri.parse(baseApiUrl+'verifyOtp'),
    headers: {
      'Content-Type':'application/json',
      'Accept': 'application/json',
      'Authorization':'Bearer $token'
    },
    body: json.encode({'otp':otp})
  );
  var data = json.decode(responce.body);
  print(data);
  return data;
}

getMatchDataById(String token,String gameId,String userId) async{
  var responce = await http.post(
    Uri.parse(baseApiUrl+'getContestByMatch'),
    headers: {
      'Content-Type':'application/json',
      'Accept': 'application/json',
      'Authorization':'Bearer $token'
    },
    body: json.encode({'match_id':gameId,'user_id':userId})
  );
  var data = json.decode(responce.body);
  print('done');
  return data;
}

getMyTeam(String token,String gameId,String userId) async{
  var responce = await http.post(
    Uri.parse(baseApiUrl+'getMyTeam'),
    headers: {
      'Content-Type':'application/json',
      'Accept': 'application/json',
      'Authorization':'Bearer $token'
    },
    body: json.encode({'match_id':gameId,'user_id':userId})
  );
  var data = json.decode(responce.body);
  print('done');
  return data;
}

getNewContestStatus(String token,String gameId,String userId,int contestId) async{
  var responce = await http.post(
    Uri.parse(baseApiUrl+'joinNewContestStatus'),
    headers: {
      'Content-Type':'application/json',
      'Accept': 'application/json',
      'Authorization':'Bearer $token'
    },
    body: json.encode({'match_id':gameId,'user_id':userId,'contest_id':contestId})
  );
  var data = json.decode(responce.body);
  print('done');
  return data;
}

joinContest(String token,String gameId,String userId,int contestId,List<int> selectedTeam) async{
  var responce = await http.post(
    Uri.parse(baseApiUrl+'joinContest'),
    headers: {
      'Content-Type':'application/json',
      'Accept': 'application/json',
      'Authorization':'Bearer $token'
    },
    body: json.encode({'match_id':gameId,'user_id':userId,'contest_id':contestId,'created_team_id':selectedTeam})
  );
  var data = json.decode(responce.body);
  print('done');
  return data;
}

getPlayers(String token,String gameId) async{
  var responce = await http.post(
    Uri.parse(baseApiUrl+'getPlayer'),
    headers: {
      'Content-Type':'application/json',
      'Accept': 'application/json',
      'Authorization':'Bearer $token'
    },
    body: json.encode({'match_id':gameId})
  );
  var data = json.decode(responce.body);
  print('done');
  return data;
}

createTeam(String token,var data) async{
  var responce = await http.post(
    Uri.parse(baseApiUrl+'createTeam'),
    headers: {
      'Content-Type':'application/json',
      'Accept': 'application/json',
      'Authorization':'Bearer $token'
    },
    body: json.encode(data)
  );
  var res = json.decode(responce.body);
  print('done');
  return res;
}

getPoints(String token,String gameId,String userId,int teamId) async{
  var responce = await http.post(
    Uri.parse(baseApiUrl+'getPoints'),
    headers: {
      'Content-Type':'application/json',
      'Accept': 'application/json',
      'Authorization':'Bearer $token'
    },
    body: json.encode({'match_id':gameId,'user_id':userId,'team_id':teamId})
  );
  var res = json.decode(responce.body);
  print(res);
  return res;
}

getPriceBreakUp(String token,String gameId,String userId,int contestId) async{
  var responce = await http.post(
    Uri.parse(baseApiUrl+'getPrizeBreakup'),
    headers: {
      'Content-Type':'application/json',
      'Accept': 'application/json',
      'Authorization':'Bearer $token'
    },
    body: json.encode({'match_id' : gameId, 'user_id' : userId, "contest_id" : contestId})
  );
  var res = json.decode(responce.body);
  print(res);
  return res;
}

getLeaderBoard(String token,String gameId,String userId,int contestId) async{
  var responce = await http.post(
    Uri.parse(baseApiUrl+'leaderBoard'),
    headers: {
      'Content-Type':'application/json',
      'Accept': 'application/json',
      'Authorization':'Bearer $token'
    },
    body: json.encode({'match_id' : gameId, 'user_id' : userId, "contest_id" : contestId})
  );
  var res = json.decode(responce.body);
  print(res);
  return res;
}

getWalletDetails(String token,String userId) async{
  var responce = await http.post(
    Uri.parse(baseApiUrl+'getWallet'),
    headers: {
      'Content-Type':'application/json',
      'Accept': 'application/json',
      'Authorization':'Bearer $token'
    },
    body: json.encode({'user_id' : userId,})
  );
  var res = json.decode(responce.body);
  print(res);
  return res;
}

getTransactionHistory(String token,String userId) async{
  var responce = await http.get(
    Uri.parse(baseApiUrl+'transactionHistory'),
    headers: {
      'Content-Type':'application/json',
      'Accept': 'application/json',
      'Authorization':'Bearer $token'
    },
  );
  var res = json.decode(responce.body);
  print(responce.body);
  return res;
}

getGameHistory(String token,String userId) async{
  var responce = await http.get(
    Uri.parse(baseApiUrl+'gameHistory'),
    headers: {
      'Content-Type':'application/json',
      'Accept': 'application/json',
      'Authorization':'Bearer $token'
    },
  );
  var res = json.decode(responce.body);
  print(responce.body);
  return res;
}

getMyContestHistory(String token,String userId,String actionType) async{
  var responce = await http.post(
    Uri.parse(baseApiUrl+'getMatchHistory'),
    headers: {
      'Content-Type':'application/json',
      'Accept': 'application/json',
      'Authorization':'Bearer $token'
    },
    body: json.encode({
      'user_id' : userId,
      'action_type': actionType
    })
  );
  var res = json.decode(responce.body);
  print(res);
  return res;
}

getProfile(String userId) async{
  var responce = await http.post(
    Uri.parse(baseApiUrl+'getProfile'),
    body: json.encode({
      'user_id' : userId,
    })
  );
  var res = json.decode(responce.body);
  print(res);
  return res;
}

updatePr(String token,var data) async{
  var responce = await http.post(
    Uri.parse(baseApiUrl+'updateProfile'),
    headers: {
      'Content-Type':'application/json',
      'Accept': 'application/json',
      'Authorization':'Bearer $token'
    },
    body: json.encode(data)
  );
  var res = json.decode(responce.body);
  print(res);
  return res;
}

changePass(String token,String cpass,String npass) async{
  var responce = await http.post(
    Uri.parse(baseApiUrl+'changePassword'),
    headers: {
      'Content-Type':'application/json',
      'Accept': 'application/json',
      'Authorization':'Bearer $token'
    },
    body: json.encode({
      "c_password": cpass,
      "new_password": npass
    })
  );
  var res = json.decode(responce.body);
  print(res);
  return res;
}

changePass2(String token,String npass,String mobile,String otp) async{
  var responce = await http.post(
    Uri.parse(baseApiUrl+'changePasswordNew'),
    headers: {
      'Content-Type':'application/json',
      'Accept': 'application/json',
      'Authorization':'Bearer $token'
    },
    // headers: header,
    body: json.encode({
      "new_password": npass,
      'otp':otp,
      'mobile_number': mobile
    })
  );
  print(responce.body);
  var res = json.decode(responce.body);
  print(res);
  return res;
}

createCashFreeOrderId(String token,String amount) async{

    var responce = await http.post(
    Uri.parse(baseApiUrl+'createCashfreeOrder'),
    headers: {
      'Content-Type':'application/json',
      'Accept': 'application/json',
      'Authorization':'Bearer $token'
    },
    body: json.encode({
      "amount": amount,
    })
  );
  var res = json.decode(responce.body);
  print(res);
  return res;

}

withdrawRequest(String token,String userid,String amount) async{

  var responce = await http.post(
    Uri.parse(baseApiUrl+'withdrawAmount'),
    headers: {
      'Content-Type':'application/json',
      'Accept': 'application/json',
      'Authorization':'Bearer $token'
    },
    body: json.encode({
      "user_id":userid,
      "withdraw_amount":amount
    })
  );
  var res = json.decode(responce.body);
  print(res);
  return res;

}

resendOtp(String number) async{
  
    var responce = await http.post(
    Uri.parse(baseApiUrl+'sendForgotPasswordOtp'),
    headers: {
      'Content-Type':'application/json',
      'Accept': 'application/json',
    },
    body: json.encode({
      "mobile_number":number
    })
  );
  var res = json.decode(responce.body);
  print(res);
  return res;

}

generatePaymentToke({String? cfKey,String? cfSecret,String? orderId,String? amount,String? currency}) async{

  var responce = await http.post(
    Uri.parse('https://api.cashfree.com/api/v2/cftoken/order'),
    headers: {
      'Content-Type':'application/json',
      'Accept': 'application/json',
      'x-client-id': cfKey!,
      'x-client-secret': cfSecret!
    },
    body: json.encode({
      "orderId": orderId,
      "orderAmount": amount,
      "orderCurrency": currency
    })
  );
  var res = json.decode(responce.body);
  print(res);
  return res;

}

setTeamName(String token,var data) async{

  var responce = await http.post(
    Uri.parse(baseApiUrl+'setTeamName'),
    headers: {
      'Content-Type':'application/json',
      'Accept': 'application/json',
      'Authorization':'Bearer $token'
    },
    body: json.encode(data)
  );
  var res = json.decode(responce.body);
  print(res);
  return res;

}

ForgetPassVerify(String mno) async{

  var responce = await http.post(
    Uri.parse(baseApiUrl+'forgotPassword'),
    headers: header,
    body: json.encode({
      'mobile_number':mno
    })
  );
  var res = json.decode(responce.body);
  print(res);
  return res;

}