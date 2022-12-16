import 'package:flutter/material.dart';
import 'package:ics_321_project_database/databaseUtility.dart';
//the needed varebails..............................................................
String weight = "";
String insuranceAmount = "";
String country = "";
String reigon = "";
String city = "";
String zipcode = "";
String height = "";
String width = "";
String length = "";
String deliverDate = "";
String category = "";


class EAddPackages extends StatefulWidget {
  const EAddPackages({Key? key}) : super(key: key);

  @override
  State<EAddPackages> createState() => _EAddPackages();
}

class _EAddPackages extends State<EAddPackages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(title: Text("Add Package", style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 30),),centerTitle: true,backgroundColor: Colors.blueGrey,),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [

                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'weight',),
                  onChanged: (text){weight = text;},
                ),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'insurance Amount',),
                  onChanged: (text){insuranceAmount = text;},
                ),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'country',),
                  onChanged: (text){country = text;},
                ),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'reigon',),
                  onChanged: (text){reigon = text;},
                ),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'city',),
                  onChanged: (text){city = text;},
                ),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'zipcode',),
                  onChanged: (text){zipcode = text;},
                ),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'height',),
                  onChanged: (text){height = text;},
                ),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'width',),
                  onChanged: (text){width = text;},
                ),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'length',),
                  onChanged: (text){length = text;},
                ),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'deliverDate',),
                  onChanged: (text){deliverDate = text;},
                ),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'category',),
                  onChanged: (text){category = text;},
                ),
                SizedBox(height: 40,),
                SizedBox(
                  height: 60,
                  width: 160,
                  child: ElevatedButton(onPressed: () {

                    addPackage( weight,  insuranceAmount,  country,  reigon,  city,  zipcode,  height,  width,  length,  deliverDate,  category);
                    Navigator.pop(context);

                  }, child: Text("Add",style: TextStyle(fontSize: 20),),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(175, 55),
                          primary: Colors.blueGrey,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                      )
                  ),
                ),
                SizedBox(height: 40,),




              ],
            ),
          )),
    );
  }
}
