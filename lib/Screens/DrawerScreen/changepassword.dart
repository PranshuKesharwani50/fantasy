import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playon69/Extra/CommonFunctions.dart';
import 'package:playon69/apis/apis.dart';
import 'package:playon69/customs/CustomTextField.dart';

import '../../Extra/AppTheme.dart';
import '../../Extra/assets.dart';
import '../../apis/sharedPreference.dart';

class changepassword extends StatefulWidget {
  const changepassword({super.key});

  @override
  State<changepassword> createState() => _changepasswordState();
}

class _changepasswordState extends State<changepassword> {

  TextEditingController opass = TextEditingController();
  TextEditingController npass = TextEditingController();
  TextEditingController cpass = TextEditingController();

  changeNewPassword() async{

    if(npass.text==cpass.text){
      var responce = await retrivePref(method: methods.Maps, key: 'currentUser');
      var res = await changePass(responce['token'], opass.text, npass.text);
      if(res['status']==true){
        opass.clear();
        cpass.clear();
        npass.clear();
        Fluttertoast.showToast(msg: res['message']);
      }else{
        Fluttertoast.showToast(msg: res['message']);
      }
    }else{
      Fluttertoast.showToast(msg: 'New password and confirm password not match');
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:ImageIcon(AssetImage(backicon))
        ),
        titleSpacing: -4,
        automaticallyImplyLeading: false,
        backgroundColor: appBarColor,
        title: Text('Change Password',
          style: TextStyle(
            color: textColor1,
            fontFamily: font,
            fontSize: 14
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: height(context, 0.3),
            child: Column(
              children: [
                SvgPicture.asset(mlogin,height: height(context, 0.25),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Change Your Password',
                      style: TextStyle(
                        fontFamily: font,
                        color: textColor2,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: upComingBg,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
                )
              ),
              child: ListView(
                children: [
                  CustomTextField(
                    font: font,
                    fontColor: textColor4,
                    fontSize: 12,
                    radiusSize: 5,
                    paddingSize: EdgeInsets.all(10),
                    label: 'Current Password', 
                    widget: TextFormField(
                      validator: (data){
                        if(data==null){
                          return 'Enter current password';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Current Password',
                        hintStyle: TextStyle(
                          fontFamily: font
                        )
                      ),
                      controller: opass,
                    )
                  ),
                  SizedBox(height: 15,),
                  CustomTextField(
                    font: font,
                    fontColor: textColor4,
                    fontSize: 12,
                    radiusSize: 5,
                    paddingSize: EdgeInsets.all(10),
                    label: 'New Password', 
                    widget: TextFormField(
                      validator: (data){
                        if(data==null){
                          return 'Enter new password';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'New Password',
                        hintStyle: TextStyle(
                          fontFamily: font
                        )
                      ),
                      controller: npass,
                    )
                  ),
                  SizedBox(height: 15,),
                  CustomTextField(
                    font: font,
                    fontColor: textColor4,
                    fontSize: 12,
                    radiusSize: 5,
                    paddingSize: EdgeInsets.all(10),
                    label: 'Confirm Password', 
                    widget: TextFormField(
                      validator: (data){
                        if(data==null){
                          return 'Enter confirm password';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(
                          fontFamily: font
                        )
                      ),
                      controller: cpass,
                    )
                  ),
                  SizedBox(height: 15,),
                  InkWell(
                    onTap: (){
                      //Navigator.push(context, MaterialPageRoute(builder: (ctx) => CreateTeam(match: widget.match,)));
                      changeNewPassword();
                    },
                    child: Container(
                      height: height(context, 0.06),
                      width: width(context, 0.9),
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(
                        top: 15,
                        bottom: 15
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5)
                        ),
                        color: buttonBgColor
                      ),
                      child: Text('Reset Password',
                        style: TextStyle(
                          fontFamily: font,
                          color: textColor1
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
