// ignore_for_file: file_names, prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playon69/Screens/MenuScreen.dart';
import 'package:playon69/apis/apis.dart';

import '../Extra/AppTheme.dart';
import '../Extra/CommonFunctions.dart';
import '../Extra/assets.dart';
import '../customs/CustomButton.dart';

class OtpVerification extends StatelessWidget {
  OtpVerification({
    this.number,
    this.token
  });

  String? number;
  String? token;
  var otpData;

  void verify(BuildContext context) async{
    var responce = await verifyOtp(otpData, token!);
    if(responce['status']==true){
      Fluttertoast.showToast(msg: '${responce['message']}');
      Navigator.push(context, MaterialPageRoute(builder: ((context) => MenuScreen())));
    }else{
      Fluttertoast.showToast(msg: '${responce['message']}');
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
                  child: Row(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: SvgPicture.asset(goBack),
                      ),
                      SizedBox(width: 10,),
                      Text(
                        'OTP Verification',
                        style: TextStyle(
                          fontFamily: font,
                          fontSize: 14,
                          color: textColor1
                        ),
                      ),
                    ],
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
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(
                        top: 30
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40),
                        ),
                        //color: Colors.red
                        color: upComingBg
                      ),
                      height: height(context, 0.78),
                      child: Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(otpBg),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [          
                              SizedBox(height: 40,),
                              SvgPicture.asset(otpDegine),
                              SizedBox(height: 30,),
                              Text('OTP Verification',
                                style: TextStyle(
                                  fontSize: 20,
                                  letterSpacing: -1,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text('******',
                                style: TextStyle(
                                  fontSize: 25,
                                  letterSpacing: 5,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text('We have sent an OTP on your number',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: font,
                                  color: textColor4
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text('+91 $number',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: font,
                                  color: textColor5
                                ),
                              ),
                              SizedBox(height: 10,),
                              OtpTextField(
                                onSubmit: (value){
                                  otpData = value;
                                },
                                fieldWidth: 40,
                                numberOfFields: 6,
                                enabled: true,
                                showFieldAsBox: true,
                                enabledBorderColor: borderColor2,
                                cursorColor: borderColor2,
                                filled: true,
                                fillColor: otpTextFieldBg,
                                textStyle: TextStyle(
                                  color: textColor2,
                                  fontFamily: font,
                                  fontSize: 16
                                ),
                              ),
                              SizedBox(height: 45,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Didn\'t received the OTP?',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: font,
                                      color: textColor4
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  InkWell(
                                    child: Text('Resend OTP?',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: font,
                                        color: textColor5
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30,),
                              CustomButton(
                                mainAlignment: MainAxisAlignment.center,
                                widget: Container(),
                                onTap: (){
                                  verify(context);
                                },
                                label: 'OTP Verify',
                                borderWidth: 0,
                                borderColor: borderColor2,
                                borderRadius: 8,
                                padding: EdgeInsets.all(15),
                                fontFamily: font,
                                fontSize: 15,
                                color: buttonBgColor,
                                fontColor: textColor1,
                                width: width(context, 0.75),
                                alignment: Alignment.topCenter,
                              )
                            ],
                          ),
                        ],
                      ),
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