import 'package:flutter/material.dart';
import 'package:playon69/Extra/AppTheme.dart';
import 'package:playon69/Extra/assets.dart';
import 'package:playon69/Screens/DrawerScreen/VerifyAccountScreen.dart';
import 'package:playon69/Screens/DrawerScreen/withdraw_money.dart';
class verifydocument extends StatefulWidget {
  const verifydocument({super.key});

  @override
  State<verifydocument> createState() => _verifydocumentState();
}

class _verifydocumentState extends State<verifydocument> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,

      backgroundColor: borderColor5,
        appBar: AppBar(
        title: const Text('Verify Document',
        style: TextStyle(fontSize: 14, fontFamily: font)),
    //automaticallyImplyLeading: false,
    backgroundColor: appBarColor,
    leading: IconButton(
    onPressed: (){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => verifyaccount()));
    },
    icon:const ImageIcon(AssetImage(backicon)
    )
    ),
    titleSpacing: 4,
    ),
      body:SingleChildScrollView(child:
      Padding(
        padding: const EdgeInsets.only(top: 12,right: 8,left: 8,),
        child: Container(
    height: double.maxFinite, width: MediaQuery.of(context).size.width,
    decoration: const BoxDecoration(
    shape: BoxShape.rectangle,
    color: borderColor,
    borderRadius: BorderRadius.all(
     Radius.circular(25.0),

    ),
    ),
          child: Column(
            children: [ const Padding(
              padding: EdgeInsets.only(top: 15,right: 200,),
              child: Text('Max File Size 5MB', style: TextStyle(
                  fontSize: 14,
                  fontFamily: font,
                  color: textColor5)),
            ),
              const Padding(
                padding: EdgeInsets.only(top: 15,right: 205,),
                child: Text('Upload Document', style: TextStyle(
                    fontSize: 13,
                    fontFamily: font,
                    color:textColor4)),
              ),
              const SizedBox(height: 15,),
              InkWell(
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.red,
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                  ),
                  height: 50,
                  width: 300,
                  child: const Center(
                    child:  Text("PAN",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: font,
                            color: Colors.white)),

                  ),
                ),
                onTap: () {
                  print('tep on button');
                },
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: TextFormField(
                //  cursorColor: Theme.of(context).,
                  //initialValue: 'Input text',
                 // maxLength: 20,
                  decoration: const InputDecoration(
                   // icon: Icon(Icons.favorite),
                    labelText: 'Enter Name (as per PAN)',
                    labelStyle: TextStyle(
                     fontFamily: font,color:textColor2,fontSize: 13
                    ),
                   // helperText: 'Helper text',
                   //  suffixIcon: Icon(
                   //    Icons.check_circle,
                   //  ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: textColor5),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24,left: 24),
                child: TextFormField(
                 // cursorColor: Theme.of(context).cursorColor,
                  //initialValue: 'Input text',
                  maxLength: 10,
                  decoration: const InputDecoration(
                   // icon: Icon(Icons.favorite),
                    labelText: 'Enter PAN Card Number',
                    labelStyle: TextStyle(
                      fontFamily: font,color:textColor2,fontSize: 13
                    ),
                  //  helperText: 'Helper text',
                    suffixIcon: Icon(
                      Icons.check_circle,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color:textColor5),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24,right: 24, ),
                child: TextFormField(
                  // cursorColor: Theme.of(context).cursorColor,
                 // initialValue: 'Input text',
                  maxLength: 10,
                  decoration: const InputDecoration(
                    // icon: Icon(Icons.favorite),
                    labelText: 'Confirm PAN Card Number',
                    labelStyle: TextStyle(fontSize: 13,
                        fontFamily: font,color:textColor2
                    ),
                    //  helperText: 'Helper text',
                    suffixIcon: Icon(
                      Icons.check_circle,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color:textColor5),
                    ),
                  ),
                ),
              ),

               Text('Upload Pan Card'),
              Container(
                height: 100,width: 300,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green)
                ),
                //child:Center(child: Image.asset(pancard))
              ),
              InkWell(
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color:textColor5,
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                  ),
                  height: 50,
                  width: 200,
                  child: const Center(
                    child:  Text("NEXT",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: font,
                            color: textColor1)),

                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,MaterialPageRoute(builder: (ctx)=> withdraw()));
                  print('tep on button');
                },
              ),

            ],
          ),
        ),
      )
    ));
  }
}
