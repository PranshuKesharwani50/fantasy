
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                    child: Container(
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
                    ),
                  ),
                  SizedBox(height: 10,),
                  CustomTextField(
                    font: font,
                    fontColor: textColor4,
                    fontSize: 12,
                    radiusSize: 10,
                    paddingSize: EdgeInsets.all(10),
                    label: 'Amount to add', 
                    widget: TextFormField(
                      validator: (data){
                        if(data==null){
                          return 'Amount to add';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        //prefix: Image.asset(coin,height: 20,),
                        border: InputBorder.none,
                        hintText: 'Amount to add',
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
                    label: 'Amount to add', 
                    widget: TextFormField(
                      validator: (data){
                        if(data==null){
                          return 'Amount to add';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        //prefix: Image.asset(coin,height: 20,),
                        border: InputBorder.none,
                        hintText: 'Amount to add',
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
                    label: 'Amount to add', 
                    widget: TextFormField(
                      validator: (data){
                        if(data==null){
                          return 'Amount to add';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        //prefix: Image.asset(coin,height: 20,),
                        border: InputBorder.none,
                        hintText: 'Amount to add',
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
                    label: 'Amount to add', 
                    widget: TextFormField(
                      validator: (data){
                        if(data==null){
                          return 'Amount to add';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        //prefix: Image.asset(coin,height: 20,),
                        border: InputBorder.none,
                        hintText: 'Amount to add',
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
                    label: 'Amount to add', 
                    widget: TextFormField(
                      validator: (data){
                        if(data==null){
                          return 'Amount to add';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        //prefix: Image.asset(coin,height: 20,),
                        border: InputBorder.none,
                        hintText: 'Amount to add',
                        hintStyle: TextStyle(
                          fontFamily: font
                        )
                      ),
                      controller: amt,
                    )
                  ),
                  SizedBox(
                    height: 10,
                  ),
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