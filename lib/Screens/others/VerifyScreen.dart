import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:playon69/Models/UserModel.dart';
import 'package:playon69/Screens/others/BankDetailScreen.dart';
import 'package:playon69/apis/sharedPreference.dart';
import 'package:playon69/auth/OtpScreen.dart';

import '../../Extra/AppTheme.dart';
import '../../Extra/assets.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {

  LoginResponceModel? user;

  void getUser() async{
    var res = await retrivePref(method: methods.Maps, key: 'currentUser');
    user = LoginResponceModel.fromJson(Map<String, dynamic>.from(res));
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Account',
            style: TextStyle(
              fontSize: 14, 
              fontFamily: font
            )
          ),
        backgroundColor: appBarColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: ImageIcon(AssetImage(backicon))
        ),
        titleSpacing: -4,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text('We need to verify your information. Please submit the your details now to enjoy seamless withdrawals',
                    style: TextStyle(
                      fontFamily: font,
                      fontSize: 14,
                      color: textColor4
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: upComingBg,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30)
                )
              ),
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 5,
                      right: 10
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10)
                      ),
                      color: tileBgColor
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(phone,width: 60,),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Mobile Number',
                                  style: TextStyle(
                                    fontFamily: font,
                                    fontSize: 12,
                                    color: textColor4
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text('${user!.userData!.mno}',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: font,
                                    color: textColor2
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        InkWell(
                          onTap: user!.userData!.accountVerified==0 ? (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> OtpVerification(token: user!.token,number: user!.userData!.mno,newAccout: false,user: user)));
                          } : null,
                          child: user!.userData!.accountVerified==0 ? Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: buttonBgColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5)
                              )
                            ),
                            child: Text('Verify Number',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: font,
                                color: textColor1
                              ),
                            )
                          ) : Image.asset(verified,height: 30,),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.only(
                      top: 5,
                      right: 10
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10)
                      ),
                      color: tileBgColor
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(id,width: 60,),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Upload ID Proof',
                                  style: TextStyle(
                                    fontFamily: font,
                                    fontSize: 12,
                                    color: textColor4
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text('---',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: font,
                                    color: textColor4
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        InkWell(
                          onTap: (){},
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: buttonBgColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5)
                              )
                            ),
                            child: Text('Verify KYC',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: font,
                                color: textColor1
                              ),
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.only(
                      top: 5,
                      right: 10
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10)
                      ),
                      color: tileBgColor
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(bank1),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Bank Account',
                                  style: TextStyle(
                                    fontFamily: font,
                                    fontSize: 12,
                                    color: textColor4
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text('-----',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: font,
                                    color: textColor4
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> BankAccountDetailsScreen()));
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: buttonBgColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5)
                              )
                            ),
                            child: Text('Verify KYC',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: font,
                                color: textColor1
                              ),
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}