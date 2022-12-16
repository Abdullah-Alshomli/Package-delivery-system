import 'package:flutter/material.dart';
import 'package:ics_321_project_database/databaseUtility.dart';
import 'package:ics_321_project_database/Login.dart';
//the needed varebails..............................................................
String name = "";
String email = "";
String password = "";
String country = "";
String city = "";
String reigon = "";
String zipcode = "";



class CUpdateInformation extends StatefulWidget {
  const CUpdateInformation({Key? key}) : super(key: key);

  @override
  State<CUpdateInformation> createState() => _CUpdateInformation();
}

class _CUpdateInformation extends State<CUpdateInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(title: Text("Update Information", style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 30),),centerTitle: true,),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [

                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'name',),
                  onChanged: (text){name = text;},
                ),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'password',),
                  onChanged: (text){password = text;},
                ),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'country',),
                  onChanged: (text){country = text;},
                ),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'city',),
                  onChanged: (text){city = text;},
                ),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'reigon',),
                  onChanged: (text){reigon = text;},
                ),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'zipcode',),
                  onChanged: (text){zipcode = text;},
                ),
                SizedBox(height: 40,),
                SizedBox(
                  height: 60,
                  width: 160,
                  child: ElevatedButton(onPressed: () {
                    updateInformation( UserEmail.email,  name,  password,  country,  city,  reigon,  zipcode);

                    Navigator.pop(context);
                  }, child: Text("Update",style: TextStyle(fontSize: 20),),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(175, 55),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                    ),
                  ),
                ),
                SizedBox(height: 40,),




              ],
            ),
          )),
    );
  }
}
