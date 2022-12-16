import 'package:flutter/material.dart';
import 'package:ics_321_project_database/databaseUtility.dart';
import 'package:ics_321_project_database/Login.dart';
//the needed varebails..............................................................
String cost = "5SR";
String cardNum = "";
String nameOnCard = "";
String civ = "";

String status = "";
List<String> packagesID =<String>[""];
List<String> FBK =<String>[""];
String selected = packagesID.first;




class CPay extends StatefulWidget {
  const CPay({Key? key}) : super(key: key);

  @override
  State<CPay> createState() => _CPay();
}

class _CPay extends State<CPay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(title: Text("Payment", style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 30),),centerTitle: true,),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [

                //dropdown
                SizedBox(height: 20,),
                Text("Packages",style: TextStyle(fontSize: 20),),
                SingleChildScrollView(child: DropdownButton<String>(
                  value: selected,
                  onChanged: (String? value) {
                    setState(() {
                      selected = value!;
                    });
                  },
                  items: packagesID.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),),
                SizedBox(height: 20,),
                Text(cost),
                SizedBox(height: 20,),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Card Number',),
                  onChanged: (text){cardNum = text;},
                ),
                SizedBox(height: 20,),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Name on The Card',),
                  onChanged: (text){nameOnCard = text;},
                ),
                SizedBox(height: 20,),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'CIV',),
                  onChanged: (text){civ = text;},
                ),

                SizedBox(height: 40,),
                SizedBox(
                  height: 60,
                  width: 200,
                  child: ElevatedButton(onPressed: () {
                    pay(UserEmail.email,selected);
                    Navigator.pop(context);
                  }, child: Text("Pay",style: TextStyle(fontSize: 20),),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(175, 55),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                SizedBox(
                  height: 30,
                  width: 100,
                  child: ElevatedButton(

                      onPressed: () async{

                        FBK = await getUserPackagsIDs(UserEmail.email);
                        for(var i in FBK){
                          packagesID.add(i);
                        }
                        setState(() {
                        });},
                      child: Text("Relaod",style: TextStyle(fontSize: 15),),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(175, 55),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                    ),
                  ),
                ),








              ],
            ),
          )),
    );
  }
}
