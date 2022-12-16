import 'package:flutter/material.dart';
import 'package:ics_321_project_database/databaseUtility.dart';

//the needed varebails..............................................................
String id = "";
String barcode = "";
String status = "";



class ETracePackages extends StatefulWidget {
  const ETracePackages({Key? key}) : super(key: key);

  @override
  State<ETracePackages> createState() => _ETracePackages();
}

class _ETracePackages extends State<ETracePackages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(title: Text("Trace Packages", style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 30),),centerTitle: true,backgroundColor: Colors.blueGrey,),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [

                //get info by id and barcode
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Package Id',),
                  onChanged: (text){id = text;},
                ),
                SizedBox(height: 40,),
                SizedBox(
                  height: 60,
                  width: 160,
                  child: ElevatedButton(onPressed: () async{
                    status = await getTracePackage(id);
                    setState(() {

                    });
                  }, child: Text("Get Info",style: TextStyle(fontSize: 20),),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(175, 55),
                        primary: Colors.blueGrey,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                    ),
                  ),
                ),

                //edit
                SizedBox(height: 40,),
                Text("Status: $status",style: TextStyle(fontSize: 25),),






              ],
            ),
          )),
    );
  }
}
