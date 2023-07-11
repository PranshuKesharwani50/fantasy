import 'package:flutter/material.dart';
import 'package:playon69/Extra/AppTheme.dart';
import 'package:playon69/Extra/assets.dart';
import 'package:playon69/Screens/MenuScreen.dart';
class refund extends StatefulWidget {
  const refund({super.key});

  @override
  State<refund> createState() => _refundState();
}

class _refundState extends State<refund> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        resizeToAvoidBottomInset: false,
        backgroundColor: appBgColor,
        appBar: AppBar(
        title: const Text('Refund/Cancellation Policy',
        style: TextStyle(fontSize: 14, fontFamily: font)),
    //automaticallyImplyLeading: false,
    backgroundColor: appBarColor,
    leading: IconButton(
    onPressed: () {
    Navigator.push(
    context, MaterialPageRoute(builder: (context) => MenuScreen()));
    },
    icon: const ImageIcon(
    AssetImage(backicon),
    )),
    titleSpacing: 4,
    ),
        body: Column(
          children: [
            Container(height: 80,width: 150),
            Container(
              //constraints: BoxConstraints.expand(),
              color: textColor5,
             // height:MediaQuery.of(context).size.height,
              height: MediaQuery.of(context).size.height * 77.7/100,
              width: MediaQuery.of(context).size.width,

              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text('Protected Class Information  This includes characteristics of protected classifications under California or federal law, such as sex, age, gender, race, disability, marital status, medical conditions, gender identity and expression, and military/veteran statu Protected Class Information  This includes characteristics of protected classifications under California or federal law, such as sex, age, gender, race, disability, marital status, medical conditions, gender identity and expression, and military/veteran statu Protected Class Information  This includes characteristics of protected classifications under California or federal law, such as sex, age, gender, race, disability, marital status, medical conditions, gender identity and expression, and military/veteran statu Protected Class Information  This includes characteristics of protected classifications under California or federal law, such as sex, age, gender, race, disability, marital status, medical conditions, gender identity and expression, and military/veteran statu Protected Class Information  This includes characteristics of protected classifications under California or federal law, such as sex, age, gender, race, disability, marital status, medical conditions, gender identity and expression, and military/veteran statu Protected Class Information  This includes characteristics of protected classifications under California or federal law, such as sex, age, gender, race, disability, marital status, medical conditions, gender identity and expression, and military/veteran statu Protected Class Information  This includes characteristics of protected classifications under California or federal law, such as sex, age, gender, race, disability, marital status, medical conditions, gender identity and expression, and military/veteran statu Protected Class Information  This includes characteristics of protected classifications under California or federal law, such as sex, age, gender, race, disability, marital status, medical conditions, gender identity and expression, and military/veteran statu Protected Class Information  This includes characteristics of protected classifications under California or federal law, such as sex, age, gender, race, disability, marital status, medical conditions, gender identity and expression, and military/veteran statu Protected Class Information  This includes characteristics of protected classifications under California or federal law, such as sex, age, gender, race, disability, marital status, medical conditions, gender identity and expression, and military/veteran statu Protected Class Information  This includes characteristics of protected classifications under California or federal law, such as sex, age, gender, race, disability, marital status, medical conditions, gender identity and expression, and military/veteran statuProtected Class Information  This includes characteristics of protected classifications under California or federal law, such as sex, age, gender, race, disability, marital status, medical conditions, gender identity and expression, and military/veteran statu Protected Class Information  This includes characteristics of protected classifications under California or federal law, such as sex, age, gender, race, disability, marital status, medical conditions, gender identity and expression, and military/veteran statu Protected Class Information  This includes characteristics of protected classifications under California or federal law, such as sex, age, gender, race, disability, marital status, medical conditions, gender identity and expression, and military/veteran statu vProtected Class Information  This includes characteristics of protected classifications under California or federal law, such as sex, age, gender, race, disability, marital status, medical conditions, gender identity and expression, and military/veteran statu Protected Class Information  This includes characteristics of protected classifications under California or federal law, such as sex, age, gender, race, disability, marital status, medical conditions, gender identity and expression, and military/veteran statu'),
                ),
              ),
            )
          ],
        ),

    );


  }
}
