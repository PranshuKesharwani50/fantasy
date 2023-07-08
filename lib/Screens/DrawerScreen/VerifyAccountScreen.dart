import 'package:flutter/material.dart';
import 'package:playon69/Extra/AppTheme.dart';
import 'package:playon69/Extra/assets.dart';
import 'package:playon69/Screens/DrawerScreen/Verify_documents.dart';
import 'package:playon69/Screens/DrawerScreen/addcashscreen.dart';
class verifyaccount extends StatefulWidget {
  const verifyaccount({super.key});

  @override
  State<verifyaccount> createState() => _verifyaccountState();
}

class _verifyaccountState extends State<verifyaccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: borderColor5,
        appBar: AppBar(
        title: const Text('Verify Account',
        style: TextStyle(fontSize: 14, fontFamily: font)),
    //automaticallyImplyLeading: false,
    backgroundColor: appBarColor,
    leading: IconButton(
    onPressed: (){
    Navigator.pop(context);
    },
    icon:ImageIcon(AssetImage(backicon))),
    titleSpacing: 4,

    ),
      body:  Column(

        children: [
         // for(int i=0;i<3;i++)
          // Card(
          //
          //   margin: EdgeInsets.all(20),
          //   shape: RoundedRectangleBorder(
          //   shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.all(Radius.circular(12)
          //       )
          //   ),
          //   child: SizedBox(height: 80,width: 320),
          // ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text('We Take Your Document information for seamless withdrawls services', textAlign: TextAlign.center,style:TextStyle(
                      fontSize: 14,
                      fontFamily: font,
                      color:Colors.black,
                  ),
                  ),

                ),
                Card(

                  // elevation: 5,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          Padding(
                            padding: const EdgeInsets.only(left:12),
                            child: Image.asset(greencolor,height: 40,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text('Mobile Number',style: TextStyle(
                                fontSize: 13,
                                fontFamily: font,
                                color:Colors.black)),
                          ),
                          SizedBox(width: 130,),
                          Image.asset(verified,height: 25),
                         // SizedBox(width: 10,),

                          SizedBox(height: 80,),
                        ],
                      ),

                    ],
                  ),
                ),
                Card(

                  // elevation: 5,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    children: [

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          Padding(
                            padding: const EdgeInsets.only(left:12),
                            child: Image.asset(greencolor,height: 40,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text('For Safety and security of all transactions.',style: TextStyle(
                                fontSize: 13,
                                fontFamily: font,
                                color:Colors.black)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: InkWell(
                                child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.red,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                height: 30,
                                width: 50,
                                child: Center(
                                  child: const Text("Verify",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: font,
                                            color: Colors.white)),

                                  ),
                                ),
    onTap: () {
    Navigator.of(context).pop();
    Navigator.push(context,MaterialPageRoute(builder: (ctx)=> verifydocument()));
    print('tep on button');
    },
                            ),
                          ),
                          SizedBox(height: 80,),
                        ],
                      ),

                    ],
                  ),
                ),
                Card(

                  // elevation: 5,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          Padding(
                            padding: const EdgeInsets.only(left:12),
                            child: Image.asset(greencolor,height: 40,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text('For Quick Withdrawls of your Account',style: TextStyle(
                                fontSize: 13,
                                fontFamily: font,
                                color:Colors.black)),
                          ),
                          SizedBox(width:15,),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: InkWell(
                                child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.red,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                height: 30,
                                width: 50,
                                child: Center(
                                  child: const Text("Verify",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: font,
                                            color: Colors.white)),

                                  ),
                                ),
                              onTap: () {
                                Navigator.of(context).pop();
                                Navigator.push(context,MaterialPageRoute(builder: (ctx)=> addcash()));
                                print('tep on button');
                              },
                            ),
                          ),
                          SizedBox(height: 80,),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
