// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, deprecated_member_use, avoid_unnecessary_containers, prefer_const_constructors_in_immutables, must_be_immutable, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:playon69/Extra/CommonFunctions.dart';
import 'package:playon69/Extra/radiusSize.dart';
import 'package:playon69/apis/apis.dart';
import 'package:playon69/apis/callApi.dart';
import 'package:playon69/auth/Newpass.dart';
import 'package:playon69/auth/OtpScreen.dart';
import 'package:playon69/auth/createTeam.dart';
import 'package:playon69/customs/CustomButton.dart';
import 'package:playon69/customs/CustomTextField.dart';
import 'package:provider/provider.dart';

import '../Extra/AppTheme.dart';
import '../Extra/assets.dart';
import '../Models/UserModel.dart';
import '../Providers/CurrentUserProvider.dart';
import '../apis/sharedPreference.dart';

class Login extends StatelessWidget {
  Login({super.key});

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
                    'Log In',
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(35),
                          topLeft: Radius.circular(35),
                        ),
                        color: upComingBg
                      ),
                      height: height(context, 0.78),
                      child: LoginWidget(),
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

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {

  int index = 1;

  String loginType = 'manual';
  TextEditingController mno = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController refralCode = TextEditingController();
  TextEditingController name = TextEditingController();

  void logIn(){
    loginUser1(context,mno.text.trim(),password.text.trim(),loginType);
  }

  void signUp() async{
    if(email.text.isNotEmpty && name.text.isNotEmpty && password.text.isNotEmpty && email.text.isNotEmpty){
      showLoadingDailog(context, 'Sending otp please-wait...');
      var data = {
        'email': email.text.trim(),
        'password': password.text.trim(),
        'c_password':password.text.trim(),
        'user_type': loginType,
        'mobile_number':mno.text.trim(),
        'name':name.text.trim(),
        'team_name':'' 
      };

      var responce = await signupUser(data);
      if(responce['status']==true){
        LoginResponceModel user = LoginResponceModel.fromJson(responce);
        insertPref(method: methods.String, key: 'currentUser', value: json.encode(responce));
        Provider.of<CurrentUserProvider>(context,listen: false).insert(user);
        Fluttertoast.showToast(msg: '${responce['message']}');
        Future.delayed(Duration(seconds: 1),(){
          Navigator.of(context).pop();
          Navigator.push(context, MaterialPageRoute(builder: (ctx)=>OtpVerification(number: mno.text.trim(),token: responce['token'],newAccout: true,userId: responce['user_data']['user_name'],)));
        });
      }else{
        Navigator.of(context).pop();
        Fluttertoast.showToast(msg: '${responce['message']}');
        clear();
      }
    }else{
      Fluttertoast.showToast(msg: 'Each field should be filled');
    }
  }

  void clear(){
    mno.clear();
    name.clear();
    email.clear();
    password.clear();
    refralCode.clear();
  }

  void cancel(){
    setState(() {
      index = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(loginSignUpPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(textFieldRadius)
          )
        ),
        child: index!=3 ?Column(
          children: [
            Text('Welcome Back!',
              style: TextStyle(
                fontSize: 20,
                fontFamily: font,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 8,),
            Text('Log in to your existant account of Playon69',
              style: TextStyle(
                fontSize: 14,
                fontFamily: font,
              ),
            ),
            SizedBox(height: 38,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  mainAlignment: MainAxisAlignment.center,
                  widget: SvgPicture.asset(login,
                    color: index==1 ? textColor5 : textColor4,
                  ),
                  alignment: Alignment.center,
                  borderColor: index==1 ? borderColor2 : borderColor,
                  borderWidth: 1.5,
                  width: width(context, 0.42),
                  label: 'Login',
                  fontColor: index==1 ? textColor5 : textColor4,
                  fontFamily: font,
                  fontSize: 15, 
                  padding: EdgeInsets.all(10), 
                  borderRadius: 8,
                  color: buttonBgColor1, 
                  onTap: (){
                    setState(() {
                      index = 1;
                      clear();
                    });
                  }
                ),
                CustomButton(
                  mainAlignment: MainAxisAlignment.center,
                  widget: SvgPicture.asset(login,
                    color: index==2 ? textColor5 : textColor4,
                  ),
                  alignment: Alignment.center,
                  borderColor: index==2 ? borderColor2 : borderColor,
                  borderWidth: 1.5,
                  width: width(context, 0.42),
                  label: 'Sign Up',
                  fontColor: index==2 ? textColor5 : textColor4,
                  fontFamily: font,
                  fontSize: 15, 
                  padding: EdgeInsets.all(10), 
                  borderRadius: 8,
                  color: buttonBgColor1, 
                  onTap: (){
                    setState(() {
                      index = 2;
                      clear();
                    });
                  }
                ),
              ],
            ),
            SizedBox(height: 27,),
            if(index==1)
            Column(
              children: [
                CustomTextField(
                  font: font,
                  fontColor: textColor4,
                  fontSize: 12,
                  radiusSize: 5,
                  paddingSize: EdgeInsets.all(10),
                  label: 'Mobile Number',
                  widget: IntlPhoneField(
                    showCountryFlag: false,
                    //disableLengthCheck: true,
                    showDropdownIcon: false,
                    initialCountryCode: 'IN',
                    decoration: InputDecoration(
                      //contentPadding: EdgeInsets.all(5),
                      border: InputBorder.none,
                      hintText: 'Enter your mobile number',
                      hintStyle: TextStyle(
                        fontFamily: font
                      )
                    ),
                    controller: mno,
                  )
                ),
                SizedBox(height: 5,),
                CustomTextField(
                  font: font,
                  fontColor: textColor4,
                  fontSize: 12,
                  radiusSize: 5,
                  paddingSize: EdgeInsets.all(10),
                  label: 'Password', 
                  widget: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(
                        fontFamily: font
                      )
                    ),
                    controller: password,
                  )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgetPassScreen()));
                        setState(() {
                          index = 3;
                        });
                      }, 
                      child: Text('Forget Password?',
                        style: TextStyle(
                          fontFamily: font,
                          color: textColor5
                        ),
                      )
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                CustomButton(
                  mainAlignment: MainAxisAlignment.center,
                  widget: Container(),
                  onTap: (){
                    showLoadingDailog(context, 'Please-wait login-in');
                    logIn();
                  },
                  label: 'Log in',
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
            ),
            if(index==2)
            Column(
              children: [
                CustomTextField(
                  font: font,
                  fontColor: textColor4,
                  fontSize: 12,
                  radiusSize: 5,
                  paddingSize: EdgeInsets.all(10),
                  label: 'Referral Code', 
                  widget: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Referral Code',
                      hintStyle: TextStyle(
                        fontFamily: font
                      )
                    ),
                    controller: refralCode,
                  )
                ),
                SizedBox(height: 5,),
                CustomTextField(
                  font: font,
                  fontColor: textColor4,
                  fontSize: 12,
                  radiusSize: 5,
                  paddingSize: EdgeInsets.all(10),
                  label: 'Name', 
                  widget: TextFormField(
                    validator: (data){
                      if(data==null){
                        return 'Enter name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Name',
                      hintStyle: TextStyle(
                        fontFamily: font
                      )
                    ),
                    controller: name,
                  )
                ),
                SizedBox(height: 5,),
                CustomTextField(
                  font: font,
                  fontColor: textColor4,
                  fontSize: 12,
                  radiusSize: 5,
                  paddingSize: EdgeInsets.all(10),
                  label: 'Mobile Number',
                  widget: IntlPhoneField(
                    showCountryFlag: false,
                    //disableLengthCheck: true,
                    showDropdownIcon: false,
                    initialCountryCode: 'IN',
                    decoration: InputDecoration(
                      //contentPadding: EdgeInsets.all(5),
                      border: InputBorder.none,
                      hintText: 'Enter Mobile Number',
                      hintStyle: TextStyle(
                        fontFamily: font
                      )
                    ),
                    controller: mno,
                  )
                ),
                SizedBox(height: 5,),
                CustomTextField(
                  font: font,
                  fontColor: textColor4,
                  fontSize: 12,
                  radiusSize: 5,
                  paddingSize: EdgeInsets.all(10),
                  label: 'Email Address', 
                  widget: TextFormField(
                    validator: (data){
                      if(data==null){
                        return 'Enter email-id';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Email id',
                      hintStyle: TextStyle(
                        fontFamily: font
                      )
                    ),
                    controller: email,
                  )
                ),
                SizedBox(height: 5,),
                CustomTextField(
                  font: font,
                  fontColor: textColor4,
                  fontSize: 12,
                  radiusSize: 5,
                  paddingSize: EdgeInsets.all(10),
                  label: 'Password', 
                  widget: TextFormField(
                    validator: (data){
                      if(data==null){
                        return 'Enter password';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Password',
                      hintStyle: TextStyle(
                        fontFamily: font
                      )
                    ),
                    controller: password,
                  )
                ),
                SizedBox(height: 30,),
                CustomButton(
                  mainAlignment: MainAxisAlignment.center,
                  widget: Container(),
                  onTap: (){
                    signUp();
                    //createAccount();
                    //Navigator.push(context, MaterialPageRoute(builder: (ctx) => OtpVerification()));
                  },
                  label: 'Sign Up',
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
            //SignUpDailog()
          ],
        ) : 
        ForgetPass(cancel: cancel,)
      ),
    );
  }
}

class ForgetPass extends StatelessWidget {
  ForgetPass({
    this.cancel
  });

  Function? cancel;

  TextEditingController mno = TextEditingController();

  verify(BuildContext context) async{
    var res = await ForgetPassVerify(mno.text);
    if(res['status']==true){
      Fluttertoast.showToast(msg: 'OTP send to ${mno.text}');
      Navigator.push(context, MaterialPageRoute(builder: (ctx)=> NewPassword(token: res['token'],mno: mno.text,)));
    }else{
      Fluttertoast.showToast(msg: 'Failed to send OTP');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: (){
                cancel!();
              },
              child: Text('Cancel',
                style: TextStyle(
                  fontFamily: font,
                  color: textColor4
                ),
              ),
            ),
            SizedBox(width: 5,)
          ],
        ),
        Text('Forget Password!',
          style: TextStyle(
            fontSize: 20,
            fontFamily: font,
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 8,),
        Text('Enter your mobile number to change your password',
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
          label: 'Mobile Number',
          widget: IntlPhoneField(
            showCountryFlag: false,
            //disableLengthCheck: true,
            showDropdownIcon: false,
            initialCountryCode: 'IN',
            decoration: InputDecoration(
              //contentPadding: EdgeInsets.all(5),
              border: InputBorder.none,
              hintText: 'Enter Mobile Number',
              hintStyle: TextStyle(
                fontFamily: font
              )
            ),
            controller: mno,
          )
        ),
        SizedBox(height: 30,),
        CustomButton(
          mainAlignment: MainAxisAlignment.center,
          widget: Container(),
          onTap: (){
            verify(context);
          },
          label: 'Verify',
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
    );
  }
}