// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playon69/Screens/MenuScreen.dart';
import 'package:playon69/apis/apis.dart';
import 'package:playon69/apis/sharedPreference.dart';

import '../Extra/AppTheme.dart';
import '../Extra/CommonFunctions.dart';
import '../Extra/assets.dart';
import '../customs/CustomButton.dart';
import '../customs/CustomTextField.dart';

class CreateTeamScreen extends StatelessWidget {
  CreateTeamScreen({
    this.userId
  });

  String? userId;

  TextEditingController teamName = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController pincode = TextEditingController();

  void createTeamData(BuildContext context) async{

    var responce = await retrivePref(method: methods.Maps, key: 'currentUser');

    var data = {
      "user_id":responce['user_data']['user_name'],
      "team_name":teamName.text,
      "state":state.text,
      "district":district.text,
      "pinCode":pincode.text
    };

    var res = await setTeamName(responce['token'], data);
    if(res['status']==true){
      Fluttertoast.showToast(msg: 'Welcome');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => MenuScreen())));
    }else{
      Fluttertoast.showToast(msg: res['message']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: SvgPicture.asset(bg1,fit: BoxFit.cover,)
                ),
                Container(
                  height: height(context, 0.17),
                  alignment: Alignment.center,
                  child: Image.asset(appIcon,height: 92,)
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Create Team',
                    style: TextStyle(
                      fontFamily: font,
                      fontSize: 14,
                      color: textColor1
                    ),
                  )
                )
              ],
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(35),
                          topLeft: Radius.circular(35),
                        ),
                        color: upComingBg
                      ),
                      height: height(context, 0.78),
                      child: Column(
                        children: [
                          Text('Create Team',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: font,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 8,),
                          Text('Create your Playon69 team',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: font,
                            ),
                          ),
                          SizedBox(height: 38,),
                          CustomTextField(
                            font: font,
                            fontColor: textColor4,
                            fontSize: 12,
                            radiusSize: 5,
                            paddingSize: EdgeInsets.all(10),
                            label: 'Set Team Name', 
                            widget: TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter your team name',
                                hintStyle: TextStyle(
                                  fontFamily: font
                                )
                              ),
                              controller: teamName,
                            )
                          ),
                          SizedBox(height: 5,),
                          CustomTextField(
                            font: font,
                            fontColor: textColor4,
                            fontSize: 12,
                            radiusSize: 5,
                            paddingSize: EdgeInsets.all(10),
                            label: 'State', 
                            widget: TextFormField(
                              validator: (data){
                                if(data==null){
                                  return 'Enter State Name';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter State Name',
                                hintStyle: TextStyle(
                                  fontFamily: font
                                )
                              ),
                              controller: state,
                            )
                          ),
                          SizedBox(height: 5,),
                          CustomTextField(
                            font: font,
                            fontColor: textColor4,
                            fontSize: 12,
                            radiusSize: 5,
                            paddingSize: EdgeInsets.all(10),
                            label: 'District', 
                            widget: TextFormField(
                              validator: (data){
                                if(data==null){
                                  return 'Enter District name';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter District name',
                                hintStyle: TextStyle(
                                  fontFamily: font
                                )
                              ),
                              controller: district,
                            )
                          ),
                          SizedBox(height: 5,),
                          CustomTextField(
                            font: font,
                            fontColor: textColor4,
                            fontSize: 12,
                            radiusSize: 5,
                            paddingSize: EdgeInsets.all(10),
                            label: 'Pincode', 
                            widget: TextFormField(
                              validator: (data){
                                if(data==null){
                                  return 'Enter Pincode';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter Pincode',
                                hintStyle: TextStyle(
                                  fontFamily: font
                                )
                              ),
                              controller: pincode,
                            )
                          ),
                          SizedBox(height: 30,),
                          CustomButton(
                            mainAlignment: MainAxisAlignment.center,
                            widget: Container(),
                            onTap: (){
                              createTeamData(context);
                            },
                            label: 'Create Team',
                            borderWidth: 0,
                            borderColor: borderColor2,
                            borderRadius: 8,
                            padding: EdgeInsets.all(15),
                            fontFamily: font,
                            fontSize: 15,
                            color: buttonBgColor,
                            fontColor: textColor1,
                            width: double.infinity,
                            alignment: Alignment.topCenter,
                          )
                        ],
                      )
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}