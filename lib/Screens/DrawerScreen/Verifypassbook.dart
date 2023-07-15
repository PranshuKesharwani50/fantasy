import 'package:flutter/material.dart';
import 'package:playon69/Extra/AppTheme.dart';
import 'package:playon69/Extra/assets.dart';
import 'package:playon69/Screens/DrawerScreen/VerifyAccountScreen.dart';
class verifypassbook extends StatefulWidget {
  const verifypassbook({super.key});

  @override
  State<verifypassbook> createState() => _verifypassbookState();
}
String dropdownValue = 'Saving';

class _verifypassbookState extends State<verifypassbook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
      padding: const EdgeInsets.only(top: 12,right: 8,left: 8,),
    child: Container(
    height: 620, width: MediaQuery.of(context).size.width,
    decoration: const BoxDecoration(
    shape: BoxShape.rectangle,
    color: borderColor,
    borderRadius: BorderRadius.all(
    Radius.circular(25.0),

    ),
    ),
      child: Column(children: [
        Padding(
        padding: const EdgeInsets.only(right:24,top: 10,left: 24,),
        child: TextFormField(
          //  cursorColor: Theme.of(context).,
          //initialValue: 'Input text',
          // maxLength: 20,
          decoration: const InputDecoration(
            // icon: Icon(Icons.favorite),
            labelText: 'Bank Name',
            labelStyle: TextStyle(
                fontFamily: font,color: Colors.black38,fontSize: 13
            ),
            // helperText: 'Helper text',
            //  suffixIcon: Icon(
            //    Icons.check_circle,
            //  ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
        ),
      ),
        Padding(
          padding: const EdgeInsets.only(right:24,top: 8,left: 24,),
          child: TextFormField(
            //  cursorColor: Theme.of(context).,
            //initialValue: 'Input text',
            // maxLength: 20,
            decoration: const InputDecoration(
              // icon: Icon(Icons.favorite),
              labelText: 'Account Holder Name',
              labelStyle: TextStyle(
                  fontFamily: font,color: Colors.black38,fontSize: 13
              ),
              // helperText: 'Helper text',
              //  suffixIcon: Icon(
              //    Icons.check_circle,
              //  ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right:24,top: 8,left: 24,),
          child: TextFormField(
            //  cursorColor: Theme.of(context).,
            //initialValue: 'Input text',
            // maxLength: 20,
            decoration: const InputDecoration(
              // icon: Icon(Icons.favorite),
              labelText: 'Account Number',
              labelStyle: TextStyle(
                  fontFamily: font,color: Colors.black38,fontSize: 13
              ),
              // helperText: 'Helper text',
              //  suffixIcon: Icon(
              //    Icons.check_circle,
              //  ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right:24,top: 8,left: 24,),
          child: TextFormField(
            //  cursorColor: Theme.of(context).,
            //initialValue: 'Input text',
            // maxLength: 20,
            decoration: const InputDecoration(
              // icon: Icon(Icons.favorite),
              labelText: 'Confirm Account Number',
              labelStyle: TextStyle(
                  fontFamily: font,color: Colors.black38,fontSize: 13
              ),
              // helperText: 'Helper text',
              //  suffixIcon: Icon(
              //    Icons.check_circle,
              //  ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right:24,top: 8,left: 24,),
          child: TextFormField(
            //  cursorColor: Theme.of(context).,
            //initialValue: 'Input text',
            // maxLength: 20,
            decoration: const InputDecoration(
              // icon: Icon(Icons.favorite),
              labelText: 'IFSC code',
              labelStyle: TextStyle(
                  fontFamily: font,color: Colors.black38,fontSize: 13
              ),
              // helperText: 'Helper text',
              //  suffixIcon: Icon(
              //    Icons.check_circle,
              //  ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(height: 60,width: 300,
            child: DropdownButton<String>(
            value: dropdownValue,
            // Step 4.
            items: <String>['Saving', 'Current',]
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(fontSize:16,fontFamily: font,color: Colors.black38),
                ),
              );
            }).toList(),
            // Step 5.
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
      ),
          ),
        ),

        Text('Upload Bank Passbook and Cheque Book'),
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
              color: Colors.red,
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
                      color: Colors.white)),

            ),
          ),
          onTap: () {
            print('tep on button');
          },
        ),


      ]
      ),
    )
      ),
    );
  }
}
