import 'package:flutter/material.dart';
import 'package:ics_321_project_database/databaseUtility.dart';

//the needed varebails..............................................................
String id = "";
String barcode = "";
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


class EEditPackages extends StatefulWidget {
  const EEditPackages({Key? key}) : super(key: key);

  @override
  State<EEditPackages> createState() => _EEditPackages();
}

class _EEditPackages extends State<EEditPackages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(title: Text("Edit Packages", style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 30),),centerTitle: true,backgroundColor: Colors.blueGrey,),
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


                //edit
                SizedBox(height: 20,),
                Text("weight"),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: weight,),
                  onChanged: (text){weight = text;},
                ),
                SizedBox(height: 20,),
                Text("insurance amount"),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: insuranceAmount),
                  onChanged: (text){insuranceAmount = text;},
                ),
                SizedBox(height: 20,),
                Text("country"),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: country,),
                  onChanged: (text){country = text;},
                ),
                SizedBox(height: 20,),
                Text("reigon"),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: reigon,),
                  onChanged: (text){reigon = text;},
                ),
                SizedBox(height: 20,),
                Text("city"),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: city,),
                  onChanged: (text){city = text;},
                ),
                SizedBox(height: 20,),
                Text("zip code"),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: zipcode,),
                  onChanged: (text){zipcode = text;},
                ),
                SizedBox(height: 20,),
                Text("height"),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: height,),
                  onChanged: (text){height = text;},
                ),
                SizedBox(height: 20,),
                Text("width"),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: width,),
                  onChanged: (text){width = text;},
                ),
                SizedBox(height: 20,),
                Text("lenght"),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: length,),
                  onChanged: (text){length = text;},
                ),
                SizedBox(height: 20,),
                Text("delivery date"),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: deliverDate,),
                  onChanged: (text){deliverDate = text;},
                ),
                SizedBox(height: 20,),
                Text("package category"),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: category,),
                  onChanged: (text){category = text;},
                ),
                SizedBox(height: 40,),

                //apply and delete buttons
                SizedBox(
                  height: 60,
                  width: 200,
                  child: ElevatedButton(onPressed: () {
                    editPackage( id,  weight,  insuranceAmount,  country, reigon,  city,  zipcode,  height,  width,  length,  deliverDate, category);
                    Navigator.pop(context);
                  }, child: Text("Apply Edit",style: TextStyle(fontSize: 20),),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(175, 55),
                        primary: Colors.green,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                SizedBox(
                  height: 60,
                  width: 200,
                  child: ElevatedButton(onPressed: () {
                    deletePackage(id);
                  }, child: Text("Delete Package",style: TextStyle(fontSize: 20),),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red,
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
