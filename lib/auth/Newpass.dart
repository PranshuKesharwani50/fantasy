// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playon69/auth/login.dart';

import '../Extra/AppTheme.dart';
import '../Extra/CommonFunctions.dart';
import '../Extra/assets.dart';
import '../apis/apis.dart';
import '../customs/CustomButton.dart';
import '../customs/CustomTextField.dart';

class NewPassword extends StatefulWidget {
  NewPassword({
    required this.token,
    required this.mno
  });

  String? token;
  String? mno;

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {

  TextEditingController newPass = TextEditingController();
  TextEditingController otp = TextEditingController();

  change() async{

    var res = await changePass2(widget.token!,newPass.text,widget.mno!,otp.text);
    if(res['status']==true){
      Fluttertoast.showToast(msg: 'Your password update successfully');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => Login())));
    }else{
      Fluttertoast.showToast(msg: 'Failed to update password');
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
                    'Change Password!',
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
                          Text('Change Password!',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: font,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 8,),
                          Text('Create your new password',
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
                            label: 'OTP', 
                            widget: TextFormField(
                              //obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter OTP',
                                hintStyle: TextStyle(
                                  fontFamily: font
                                )
                              ),
                              controller: otp,
                            )
                          ),
                          SizedBox(height: 5,),
                          CustomTextField(
                            font: font,
                            fontColor: textColor4,
                            fontSize: 12,
                            radiusSize: 5,
                            paddingSize: EdgeInsets.all(10),
                            label: 'New Password', 
                            widget: TextFormField(
                              obscureText: true,
                              validator: (data){
                                if(data==null){
                                  return 'Enter New Password';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter New Password',
                                hintStyle: TextStyle(
                                  fontFamily: font
                                )
                              ),
                              controller: newPass,
                            )
                          ),
                          SizedBox(height: 30,),
                          CustomButton(
                            mainAlignment: MainAxisAlignment.center,
                            widget: Container(),
                            onTap: (){
                              change();
                            },
                            label: 'Change Password',
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