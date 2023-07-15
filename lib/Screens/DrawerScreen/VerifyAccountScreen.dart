import 'package:flutter/material.dart';
import 'package:playon69/Extra/AppTheme.dart';
import 'package:playon69/Extra/assets.dart';
import 'package:playon69/Screens/DrawerScreen/Verify_documents.dart';
import 'package:playon69/Screens/DrawerScreen/Verifypassbook.dart';
import 'package:playon69/Screens/DrawerScreen/Wallet.dart';

class verifyaccount extends StatefulWidget {
  const verifyaccount({super.key});

  @override
  State<verifyaccount> createState() => _verifyaccountState();
}

class _verifyaccountState extends State<verifyaccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: borderColor5,
      appBar: AppBar(
        title: const Text('Verify Account',
            style: TextStyle(fontSize: 14, fontFamily: font)),
        //automaticallyImplyLeading: false,
        backgroundColor: appBarColor,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Wallet()));
            },
            icon: const ImageIcon(AssetImage(backicon))),
        titleSpacing: 4,
      ),
      body: Column(
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
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'We Take Your Document information for seamless withdrawls services',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: font,
                    color: textColor2,
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
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          // child: Image.asset(
                          //   //phone,
                          //   //height: 40,
                          // ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text('Mobile Number',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: font,
                                  color: textColor2)),
                        ),
                        const SizedBox(
                          width: 130,
                        ),
                        Image.asset(verified, height: 25),
                        // SizedBox(width: 10,),

                        const SizedBox(
                          height: 80,
                        ),
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
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          // child: Image.asset(
                          //   id,
                          //   height: 40,
                          // ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                              'For Safety and security of all transactions.',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: font,
                                  color: textColor2)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: InkWell(
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: textColor5,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              height: 30,
                              width: 50,
                              child: const Center(
                                child: Text("Verify",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: font,
                                        color: textColor1)),
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) =>
                                          const verifydocument()));
                              print('tep on button');
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
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
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          // child: Image.asset(
                          //   bankaccount,
                          //   height: 40,
                          // ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text('For Quick Withdrawls of your Account',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: font,
                                  color: textColor2)),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: InkWell(
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: textColor5,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              height: 30,
                              width: 50,
                              child: const Center(
                                child: Text("Verify",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: font,
                                        color: textColor1)),
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) =>
                                          const verifypassbook()));
                              print('tep on button');
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
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
