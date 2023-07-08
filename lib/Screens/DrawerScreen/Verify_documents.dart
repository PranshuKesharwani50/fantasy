import 'package:flutter/material.dart';
import 'package:playon69/Extra/AppTheme.dart';
import 'package:playon69/Extra/assets.dart';
class verifydocument extends StatefulWidget {
  const verifydocument({super.key});

  @override
  State<verifydocument> createState() => _verifydocumentState();
}

class _verifydocumentState extends State<verifydocument> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      backgroundColor: borderColor5,
        appBar: AppBar(
        title: const Text('Verify Document',
        style: TextStyle(fontSize: 14, fontFamily: font)),
    //automaticallyImplyLeading: false,
    backgroundColor: appBarColor,
    leading: IconButton(
    onPressed: (){
    Navigator.pop(context);
    },
    icon:ImageIcon(AssetImage(backicon)
    )
    ),
    titleSpacing: 4,
    ),
      body: Padding(
        padding: const EdgeInsets.only(top: 12,right: 8,left: 8,),
        child: Container(
    height: 500, width: MediaQuery.of(context).size.width,
    decoration: const BoxDecoration(
    shape: BoxShape.rectangle,
    color: borderColor,
    borderRadius: BorderRadius.all(
     Radius.circular(25.0),

    ),
    ),
          child: Column(
            children: [ Padding(
              padding: const EdgeInsets.only(top: 15,right: 200,),
              child: Text('Max File Size 5MB', style: TextStyle(
                  fontSize: 14,
                  fontFamily: font,
                  color: Colors.red)),
            ),
              Padding(
                padding: const EdgeInsets.only(top: 15,right: 205,),
                child: Text('Upload Document', style: TextStyle(
                    fontSize: 13,
                    fontFamily: font,
                    color: Colors.grey)),
              ),
              SizedBox(height: 15,),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.red,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(7),
                    ),
                  ),
                  height: 50,
                  width: 300,
                  child: Center(
                    child:  const Text("PAN",
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
                  decoration: InputDecoration(
                   // icon: Icon(Icons.favorite),
                    labelText: 'Enter Name (as per PAN)',
                    labelStyle: TextStyle(
                     fontFamily: font,color: Colors.black38
                    ),
                   // helperText: 'Helper text',
                   //  suffixIcon: Icon(
                   //    Icons.check_circle,
                   //  ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24,left: 24,top: 12),
                child: TextFormField(
                 // cursorColor: Theme.of(context).cursorColor,
                  initialValue: 'Input text',
                  maxLength: 10,
                  decoration: InputDecoration(
                   // icon: Icon(Icons.favorite),
                    labelText: 'Enter PAN Card Number',
                    labelStyle: TextStyle(
                      fontFamily: font,color: Colors.black38
                    ),
                  //  helperText: 'Helper text',
                    suffixIcon: Icon(
                      Icons.check_circle,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF6200EE)),
                    ),
                  ),
                ),
              ),
              TextFormField(
                // cursorColor: Theme.of(context).cursorColor,
                initialValue: 'Input text',
                maxLength: 10,
                decoration: InputDecoration(
                  // icon: Icon(Icons.favorite),
                  labelText: 'Confirm PAN Card Number',
                  labelStyle: TextStyle(fontSize: 14,
                      fontFamily: font,color: Colors.black38
                  ),
                  //  helperText: 'Helper text',
                  suffixIcon: Icon(
                    Icons.check_circle,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),

              Text('Upload Pan Card'),

            ],
          ),
        ),
      )
    );
  }
}
