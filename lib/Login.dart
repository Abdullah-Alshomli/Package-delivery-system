import 'package:flutter/material.dart';
import 'package:ics_321_project_database/testt.dart';

class UserEmail{
  static String email = "email@gmail.com";
}
//the needed varebails..............................................................
String email = "";
String password = "";


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(title: Text("Login", style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 30),),centerTitle: true,),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [

                SizedBox(height: 20,),
                TextField(
                  obscureText: false,
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Email',),
                  onChanged: (text){email = text;},
                ),
                SizedBox(height: 20,),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Password',),
                  onChanged: (text){password = text;},
                ),
                SizedBox(height: 20,),
                SizedBox(
                  height: 60,
                  width: 160,
                  child: ElevatedButton(onPressed: () async{



                    if((await getCostomers()).contains(email)){
                      UserEmail.email = email;
                      Navigator.pushNamed(context, "/1");
                    }
                    else if((await getEployees()).contains(email)){
                      Navigator.pushNamed(context, "/6");
                    }
                    else{}


                  }, child: Text("Login",style: TextStyle(fontSize: 20),),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(175, 55),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                GestureDetector(child: Text("Register"), onTap: (){Navigator.pushNamed(context, "/0");})



              ],
            ),
          )),
    );
  }
}
