
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:playon69/Models/profileModel.dart';
import 'package:playon69/apis/callApi.dart';

import '../../Extra/AppTheme.dart';
import '../../Extra/CommonFunctions.dart';
import '../../Extra/assets.dart';
import '../../apis/apis.dart';
import '../../apis/sharedPreference.dart';
import '../../customs/CustomButton.dart';
import '../../customs/CustomTextField.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  ProfileModel? myProfile;
  bool? isLoading = true;
  bool expansion = false;

  @override
  void initState() {
    super.initState();
    getProfile();
  }

  void getProfile() async{
    var res = await retrivePref(method: methods.Maps, key: 'currentUser');
    myProfile = await getProfile1(context,res['user_data']['user_name']);
    if(myProfile!.status==true){
      teamName.text = myProfile!.userData!.teamName!;
      name.text = myProfile!.userData!.name!;
      gender.text = myProfile!.userData!.gender;
      state.text = myProfile!.userData!.state!;
      city.text = myProfile!.userData!.city!;
      dob.text = myProfile!.userData!.dob;

      setState(() {
        isLoading = false;
      });
    }
  }

  TextEditingController teamName = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController gender = TextEditingController(text: 'Select Gender');
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController dob = TextEditingController();

  updateProfile() async{

    var res = await retrivePref(method: methods.Maps, key: 'currentUser');
    var data = {
        'user_id': res['user_data']['user_name'],
        'team_name': teamName.text,
        'city': city.text,
        'dateOfBirth': dob.text,
        'gender': gender.text,
        'name': name.text,
        'state': state.text
      };

    var responce = await updatePr(res['token'],data);
    if(responce['status']==true){
      Navigator.of(context).pop();
    }
  }

  editProfileScreen(){

    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      context: context, 
      builder: (ctx){
        return StatefulBuilder(
          builder: (context,setState) {
            return Container(
              padding: EdgeInsets.all(15),
              height: height(context, 0.8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30)
                ),
                color: upComingBg
              ),
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Edit Profile',
                        style: TextStyle(
                          fontFamily: font,
                          color: textColor6,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  CustomTextField(
                    font: font,
                    fontColor: textColor4,
                    fontSize: 12,
                    radiusSize: 5,
                    paddingSize: EdgeInsets.all(10),
                    label: 'Team Name', 
                    widget: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Team name',
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
                    label: 'Full Name', 
                    widget: TextFormField(
                      validator: (data){
                        if(data==null){
                          return 'Enter Full name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Full name',
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
                    label: 'Gender', 
                    widget: ExpansionTile(
                      title: Text(gender.text,
                        style: TextStyle(
                          fontFamily: font,
                          fontSize: 13,
                          color: textColor2
                        ),
                      ),
                      children: [
                        ListTile(
                          onTap: (){
                            setState((){
                              gender.text = 'Male';
                              expansion = false;
                            });
                          },
                          title: Text('Male',
                            style: TextStyle(
                              fontFamily: font,
                              fontSize: 13
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: (){
                            setState((){
                              gender.text = 'Female';
                              expansion = false;
                            });
                          },
                          title: Text('Female',
                            style: TextStyle(
                              fontFamily: font,
                              fontSize: 13
                            ),
                          ),
                        ),
                      ],
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
                          return 'Enter State';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter State',
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
                    label: 'City', 
                    widget: TextFormField(
                      validator: (data){
                        if(data==null){
                          return 'Enter City';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter City',
                        hintStyle: TextStyle(
                          fontFamily: font
                        )
                      ),
                      controller: city,
                    )
                  ),
                  SizedBox(height: 5,),
                  CustomTextField(
                    font: font,
                    fontColor: textColor4,
                    fontSize: 12,
                    radiusSize: 5,
                    paddingSize: EdgeInsets.all(10),
                    label: 'Date Of Birth', 
                    widget: TextFormField(
                      validator: (data){
                        if(data==null){
                          return 'Enter Date Of Birth';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: (){
                            DatePicker.showDatePicker(
                              context,
                              showTitleActions: true,
                              minTime: DateTime(1950),
                              maxTime: DateTime(2100),
                              onConfirm: (date){
                                dob.text = DateFormat('dd-MM-yyyy').format(date);
                              }
                            );
                          }, 
                          icon:Icon(Icons.date_range)
                        ),
                        border: InputBorder.none,
                        hintText: 'Enter Date Of Birth',
                        hintStyle: TextStyle(
                          fontFamily: font
                        )
                      ),
                      controller: dob,
                    )
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        mainAlignment: MainAxisAlignment.center,
                        widget: Container(),
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        label: 'Cancel',
                        borderWidth: 0,
                        borderColor: borderColor3,
                        borderRadius: 8,
                        padding: EdgeInsets.all(15),
                        fontFamily: font,
                        fontSize: 15,
                        color: buttonBgColor1,
                        fontColor: textColor4,
                        width: width(context, 0.42),
                        alignment: Alignment.topCenter,
                      ),
                      CustomButton(
                        mainAlignment: MainAxisAlignment.center,
                        widget: Container(),
                        onTap: (){
                          updateProfile();
                        },
                        label: 'Update',
                        borderWidth: 0,
                        borderColor: borderColor2,
                        borderRadius: 8,
                        padding: EdgeInsets.all(15),
                        fontFamily: font,
                        fontSize: 15,
                        color: buttonBgColor,
                        fontColor: textColor1,
                        width: width(context, 0.42),
                        alignment: Alignment.topCenter,
                      ),
                    ],
                  )
                ],
              ),
            );
          }
        );
      });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading == false ? Stack(
          children: [
            Image.asset(walletbg),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(walletbg)
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: height(context, 0.06),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // CircleAvatar(
                          //   radius: 30,
                          //   backgroundImage: NetworkImage('${myProfile!.userData!.profileImg}'),
                          //   backgroundColor: profileBgColor,
                          // ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                              border: Border.all(
                                width: 2,
                                color: borderColor
                              )
                            ),
                            child: ClipRRect(
                              child: myProfile!.userData!.profileImg == null ? Image.asset(profileBg,height: 60,) : 
                              CachedNetworkImage(
                                imageUrl: '${myProfile!.userData!.profileImg}',
                                fit: BoxFit.fill,
                              )
                            ),
                          ),
                          SizedBox(width: 15,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${myProfile!.userData!.name}',
                                style: TextStyle(
                                  fontFamily: font,
                                  color: textColor1,
                                  fontSize: 15
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text('${myProfile!.userData!.mno}',
                                style: TextStyle(
                                  fontFamily: font,
                                  color: textColor1,
                                  fontSize: 12
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: (){
                          editProfileScreen();
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: buttonBgColor1,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5)
                            )
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(editProfile),
                              SizedBox(width: 5,),
                              Text('Edit Profile',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: font,
                                  color: textColor5
                                ),
                              )
                            ],
                          )
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      InkWell(
                        child: SvgPicture.asset(goBack),
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(width: 10,),
                      Text('My Profile',
                        style: TextStyle(
                          color: textColor1,
                          fontFamily: font,
                          fontSize: 14
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height(context, 0.13),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)
                      ),
                      color: upComingBg,
                    ),
                    //width: double.infinity,
                    child: ListView(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
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
                                  SvgPicture.asset(kyc2),
                                  SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('KYC Verify',
                                        style: TextStyle(
                                          fontFamily: font,
                                          fontSize: 13,
                                          color: textColor6
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      Text('Complete KYC to Get Withdrawal',
                                        style: TextStyle(
                                          fontSize: 11,
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
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
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
                                  SvgPicture.asset(referal),
                                  SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Use Refer Code',
                                        style: TextStyle(
                                          fontFamily: font,
                                          fontSize: 13,
                                          color: textColor6
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      // Text('Offer Earned Bonus',
                                      //   style: TextStyle(
                                      //     fontSize: 11,
                                      //     fontFamily: font,
                                      //     color: textColor4
                                      //   ),
                                      // )
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
                                  child: Text('Apply',
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
                        SizedBox(
                          height: 20,
                        ),
                        Text('Your Performance',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: font,
                            color: textColor2
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: tileBgColor
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  border: Border.all(
                                    style: BorderStyle.solid,
                                    width: 1,
                                    color: borderColor6
                                  ),
                                  color: totalGamePlayedBg
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(tgp,width: 50,),
                                    SizedBox(width: 15,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Total Games Played',
                                          style: TextStyle(
                                            fontFamily: font,
                                            fontSize: 15,
                                            color: textColor6
                                          ),
                                        ),
                                        Text('${myProfile!.userData!.gamePlayed}',
                                          style: TextStyle(
                                            fontFamily: font,
                                            fontSize: 24,
                                            color: textColor6
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(fs,height: 20,),
                                        SizedBox(width: 10,),
                                        Text('Fantasy',
                                          style: TextStyle(
                                            fontFamily: font,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: textColor6
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 13,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Join Contests',
                                              style: TextStyle(
                                                fontFamily: font,
                                                fontSize: 13,
                                                color: textColor4
                                              ),
                                            ),
                                            SizedBox(height: 2,),
                                            Text('${myProfile!.userData!.totalContestJoined}',
                                              style: TextStyle(
                                                fontFamily: font,
                                                fontSize: 13,
                                                color: textColor3
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SvgPicture.asset(winnerTropy),
                                            SizedBox(width: 10,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Winnings',
                                                  style: TextStyle(
                                                    fontFamily: font,
                                                    fontSize: 13,
                                                    color: textColor4
                                                  ),
                                                ),
                                                SizedBox(height: 2,),
                                                Row(
                                                  children: [
                                                    Image.asset(coin,height: 15,),
                                                    Text('${myProfile!.userData!.totalWinnings}',
                                                      style: TextStyle(
                                                        fontFamily: font,
                                                        fontSize: 13,
                                                        color: textColor3
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        // Column(
                        //   children: [
                        //     Container(
                        //       padding: EdgeInsets.all(20),
                        //       decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.only(
                        //           topLeft: Radius.circular(10),
                        //           topRight: Radius.circular(10)
                        //         ),
                        //         color: tileBgColor
                        //       ),
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Row(
                        //             children: [
                        //               SvgPicture.asset(kyc),
                        //               SizedBox(width: 20),
                        //               Text('KYC & Verify Details',
                        //                 style: TextStyle(
                        //                   fontFamily: font,
                        //                   fontSize: 13,
                        //                   color: textColor6
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //           SvgPicture.asset(goIn)
                        //         ],
                        //       ),
                        //     ),
                        //     Container(
                        //       padding: EdgeInsets.all(20),
                        //       decoration: BoxDecoration(
                        //         border: Border(
                        //           top: BorderSide(
                        //             color: borderColor5
                        //           ),
                        //           bottom: BorderSide(
                        //             color: borderColor5
                        //           )
                        //         ),
                        //         color: tileBgColor,
                        //       ),
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Row(
                        //             children: [
                        //               SvgPicture.asset(refer),
                        //               SizedBox(width: 20,),
                        //               Column(
                        //                 crossAxisAlignment: CrossAxisAlignment.start,
                        //                 children: [
                        //                   Text('Refer and Earn',
                        //                     style: TextStyle(
                        //                       fontFamily: font,
                        //                       fontSize: 13,
                        //                       color: textColor6
                        //                     ),
                        //                   ),
                        //                   SizedBox(height: 5,),
                        //                   Text('Invite a Friend and Collect up to ₹100 Cash Bonus',
                        //                     style: TextStyle(
                        //                       fontSize: 11,
                        //                       fontFamily: font,
                        //                       color: textColor4
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //             ],
                        //           ),
                        //           SvgPicture.asset(goIn)
                        //         ],
                        //       ),
                        //     ),
                        //     Container(
                        //       padding: EdgeInsets.all(20),
                        //       decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.only(
                        //           bottomLeft: Radius.circular(10),
                        //           bottomRight: Radius.circular(10)
                        //         ),
                        //         color: tileBgColor
                        //       ),
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Row(
                        //             children: [
                        //               SvgPicture.asset(history),
                        //               SizedBox(width: 20,),
                        //               Column(
                        //                 crossAxisAlignment: CrossAxisAlignment.start,
                        //                 children: [
                        //                   Text('Transaction-History',
                        //                     style: TextStyle(
                        //                       fontFamily: font,
                        //                       fontSize: 13,
                        //                       color: textColor6
                        //                     ),
                        //                   ),
                        //                   SizedBox(height: 5,),
                        //                   Text('All Transaction History Deposit and Withdraw',
                        //                     style: TextStyle(
                        //                       fontSize: 11,
                        //                       fontFamily: font,
                        //                       color: textColor4
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //             ],
                        //           ),
                        //           SvgPicture.asset(goIn)
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(height: height(context, 0.1),)
                      ],
                    )
                  ),
                ),
              ],
            ),
          ],
        ) : Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}