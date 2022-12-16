import 'package:flutter/material.dart';
import 'package:ics_321_project_database/databaseUtility.dart';

//the needed varebails..............................................................
String name = "";
String email = "";
String password = "";
String country = "";
String city = "";
String reigon = "";
String zipcode = "";


class Sign extends StatefulWidget {
  const Sign({Key? key}) : super(key: key);

  @override
  State<Sign> createState() => _Sign();
}

class _Sign extends State<Sign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(title: Text("Registeration", style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 30),),centerTitle: true,),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [

                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Name',),
                  onChanged: (text){name = text;},
                ),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Email',),
                  onChanged: (text){email = text;},
                ),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Password',),
                  onChanged: (text){password = text;},
                ),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Country',),
                  onChanged: (text){country = text;},
                ),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'City',),
                  onChanged: (text){city = text;},
                ),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Reigon',),
                  onChanged: (text){reigon = text;},
                ),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Zipcode',),
                  onChanged: (text){zipcode = text;},
                ),
                SizedBox(height: 20,),
                SizedBox(
                  height: 60,
                  width: 160,
                  child: ElevatedButton(onPressed: () {
                    register( name,  email,  password,  country,  reigon,  city,  zipcode);
                    Navigator.pop(context);
                  }, child: Text("Register",style: TextStyle(fontSize: 20),),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(175, 55),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                    ),
                  ),
                )



              ],
            ),
          )),
    );
  }
}
