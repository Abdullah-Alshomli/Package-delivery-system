import 'package:flutter/material.dart';
import 'package:ics_321_project_database/databaseUtility.dart';
import 'package:ics_321_project_database/Login.dart';
//the needed varebails..............................................................
String status = "";
List<String> packagesID =<String>[""];
List<String> FBK =<String>[""];
String selected = packagesID.first;






class CPackages extends StatefulWidget {
  const CPackages({Key? key}) : super(key: key);
  

  @override
  State<CPackages> createState() => _CPackages();

}

class _CPackages extends State<CPackages> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(title: Text("My Packages", style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 30),),centerTitle: true,),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [

                //dropdown
                SizedBox(height: 20,),
                Text("Select Package:",style: TextStyle(fontSize: 25),),
                SizedBox(height: 20,),
                SingleChildScrollView(child: DropdownButton<String>(
                  value: selected,
                  onChanged: (String? value) async{
                    status = await getPackagsStatus(selected);
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

                Text("Your Package Status: ",style: TextStyle(fontSize: 25)),
                SizedBox(height: 20,),
                Text(status,style: TextStyle(fontSize: 20)),


                SizedBox(height: 80,),
                SizedBox(
                  height: 60,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () async{
                        receivePackage(selected,  UserEmail.email);
                        Navigator.pop(context);
                      },
                      child: Text("Recieve Package",style: TextStyle(fontSize: 20),),
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
                      child: Text("Reload",style: TextStyle(fontSize: 15),),
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
