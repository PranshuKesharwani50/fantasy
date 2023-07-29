
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../Extra/AppTheme.dart';
import '../../Extra/CommonFunctions.dart';
import '../../Extra/assets.dart';
import '../../customs/CustomTextField.dart';

class PanCardScreen extends StatefulWidget {
  const PanCardScreen({super.key});

  @override
  State<PanCardScreen> createState() => _PanCardScreenState();
}

class _PanCardScreenState extends State<PanCardScreen> {

  TextEditingController amt = TextEditingController();
  TextEditingController dob = TextEditingController();
  File? file;
  
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
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Image.asset(pan,width: 70,),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('PAN Card Verification',
                      style: TextStyle(
                        fontFamily: font,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: textColor2
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text('Add Your Pan Card Details',
                      style: TextStyle(
                        fontFamily: font,
                        fontSize: 13,
                        color: textColor4
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
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30)
                )
              ),
              child: ListView(
                children: [
                  InkWell( 
                    onTap: () {
                      var data = filePickerDailog(context);
                      if(data!=null){
                        file = data;
                        setState(() { });
                      }
                    },
                    child: file==null ? Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10)
                        ),
                        border: Border.all(
                          width: 1,
                          color: borderColor5
                        ),
                        color: tileBgColor
                      ),
                      child: Column(
                        children: [
                          SvgPicture.asset(docupload),
                          SizedBox(height: 10,),
                          Text('Upload Pan Card Image or PDF',
                            style: TextStyle(
                              fontFamily: font,
                              fontSize: 13,
                              color: textColor4
                            ),
                          )
                        ],
                      ),
                    ) : Text('${file!.path}'),
                  ),
                  SizedBox(height: 10,),
                  CustomTextField(
                    font: font,
                    fontColor: textColor4,
                    fontSize: 12,
                    radiusSize: 10,
                    paddingSize: EdgeInsets.all(10),
                    label: 'Name (Same as on PAN Card)', 
                    widget: TextFormField(
                      validator: (data){
                        if(data==null){
                          return 'Name (Same as on PAN Card)';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        //prefix: Image.asset(coin,height: 20,),
                        border: InputBorder.none,
                        hintText: 'Name (Same as on PAN Card)',
                        hintStyle: TextStyle(
                          fontFamily: font
                        )
                      ),
                      controller: amt,
                    )
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    font: font,
                    fontColor: textColor4,
                    fontSize: 12,
                    radiusSize: 10,
                    paddingSize: EdgeInsets.all(10),
                    label: 'PAN Number', 
                    widget: TextFormField(
                      validator: (data){
                        if(data==null){
                          return 'PAN Number';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        //prefix: Image.asset(coin,height: 20,),
                        border: InputBorder.none,
                        hintText: 'PAN Number',
                        hintStyle: TextStyle(
                          fontFamily: font
                        )
                      ),
                      controller: amt,
                    )
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    font: font,
                    fontColor: textColor4,
                    fontSize: 12,
                    radiusSize: 10,
                    paddingSize: EdgeInsets.all(10),
                    label: 'Confirm PAN Number', 
                    widget: TextFormField(
                      validator: (data){
                        if(data==null){
                          return 'Confirm PAN Number';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        //prefix: Image.asset(coin,height: 20,),
                        border: InputBorder.none,
                        hintText: 'Confirm PAN Number',
                        hintStyle: TextStyle(
                          fontFamily: font
                        )
                      ),
                      controller: amt,
                    )
                  ),
                  SizedBox(height: 10),                  
                  CustomTextField(
                    font: font,
                    fontColor: textColor4,
                    fontSize: 12,
                    radiusSize: 10,
                    paddingSize: EdgeInsets.all(10),
                    label: 'Date of Birth', 
                    widget: TextFormField(
                      validator: (data){
                        if(data==null){
                          return 'Date of Birth';
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
                        //prefix: Image.asset(coin,height: 20,),
                        border: InputBorder.none,
                        hintText: 'Date of Birth',
                        hintStyle: TextStyle(
                          fontFamily: font
                        )
                      ),
                      controller: dob,
                    )
                  ),
                  SizedBox(height: 15),
                  InkWell(
                    onTap: (){
                      //Navigator.push(context, MaterialPageRoute(builder: (ctx) => CreateTeam(match: widget.match,)));
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
                      child: Text('Submit for Verification',
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