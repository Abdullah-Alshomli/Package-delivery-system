import 'package:flutter/material.dart';
import 'package:ics_321_project_database/databaseUtility.dart';

//the needed varebails..............................................................
String email = "";
List<String> packages =<String>[""];
String selected = packages.first;




class ESendEmail extends StatefulWidget {
  const ESendEmail({Key? key}) : super(key: key);

  @override
  State<ESendEmail> createState() => _ESendEmail();
}

class _ESendEmail extends State<ESendEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(title: Text("Edit Packages", style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 30),),centerTitle: true,backgroundColor: Colors.blueGrey,),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [

                //get info by email
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Email',),
                  onChanged: (text){email = text;},
                ),




                SizedBox(height: 40,),
                SizedBox(
                  height: 60,
                  width: 160,
                  child: ElevatedButton(onPressed: () {
                    sendEmail(email);
                  }, child: Text("Send Email",style: TextStyle(fontSize: 20),),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(175, 55),
                        primary: Colors.blueGrey,
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
