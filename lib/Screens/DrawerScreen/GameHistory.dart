import 'package:flutter/material.dart';
import '../../Extra/AppTheme.dart';
import '../../Extra/CommonFunctions.dart';
import '../../Extra/assets.dart';
import '../../Models/gameHistoryModel.dart';
import '../../apis/callApi.dart';
import '../../apis/sharedPreference.dart';
class gamehistory extends StatefulWidget {
  const gamehistory({super.key});

  @override
  State<gamehistory> createState() => _gamehistoryState();
}

class _gamehistoryState extends State<gamehistory> {

  GameHistoryModel? gameModel;
  bool? isLoading = true;

  @override
  void initState() {
    super.initState();
    getTransactions();
  }

  getTransactions() async{
    var res = await retrivePref(method: methods.Maps, key: 'currentUser');
    gameModel = await getGameHistory1(context, res['token'], res['user_data']['user_name']);
    if(gameModel!.status==true){
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Game History',
          style: TextStyle(
            fontSize: 14,
            fontFamily: font
          )
        ),
        backgroundColor: appBarColor,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
        icon:ImageIcon(AssetImage(backicon))),
        titleSpacing: -4,
      ),
      body: isLoading==false ? Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            for(int x=0; x<gameModel!.gameHistory!.length; x++)
            gameTile(gameModel!.gameHistory![x])
          ],
        ),
      ) : Center(child: CircularProgressIndicator(),),
    );
  }

  Widget gameTile(GameHistory data){
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: tileBgColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10)
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: width(context, 0.16),
                child: Text('${data.createdAt}',
                  style: TextStyle(
                    fontFamily: font,
                    fontSize: 13,
                    color: textColor4
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Container(
                height: 30,
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      width: 1,
                      color: borderColor5
                    )
                  )
                ),
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${data.gameStatusString}',
                    style: TextStyle(
                      fontFamily: font,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: textColor2
                    ),
                  ),
                  SizedBox(height: 3,),
                  Text('Game Id: ${data.gameId}',
                    style: TextStyle(
                      fontFamily: font,
                      fontSize: 11,
                      color: textColor4
                    ),
                  )
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Image.asset(coin,height: 15,),
                  Text(' ₹${data.entryFee}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: font,
                      fontSize: 13,
                      color: data.winStatus==1 ? textColor3 : textColor5
                    ),
                  )
                ],
              ),
              SizedBox(height: 1,),
              Text('Closing Bal: ${data.closingBal}',
                style: TextStyle(
                  fontFamily: font,
                  fontSize: 11,
                  color: textColor4
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
