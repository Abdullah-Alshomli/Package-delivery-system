import 'package:flutter/material.dart';

//the needed varebails..............................................................
String email = "";
String password = "";


class EReport extends StatefulWidget {
  const EReport({Key? key}) : super(key: key);

  @override
  State<EReport> createState() => _EReport();
}

class _EReport extends State<EReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(title: Text("Report", style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 30),),centerTitle: true,backgroundColor: Colors.blueGrey,),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [


                SizedBox(
                  height: 80,
                  width: 300,
                  child: ElevatedButton(onPressed: () {
                    // Enter your code here what happen after submetting...............................................................................
                    Navigator.pushNamed(context, "/12");
                  }, child: Text("Complete Payments",style: TextStyle(fontSize: 20),),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(175, 55),
                          primary: Colors.blueGrey,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                      )
                  ),
                ),
                SizedBox(height: 40,),
                SizedBox(
                  height: 80,
                  width: 300,
                  child: ElevatedButton(onPressed: () {
                    // Enter your code here what happen after submetting...............................................................................
                    Navigator.pushNamed(context, "/8");
                  }, child: Text("Package Type Sent",style: TextStyle(fontSize: 20),),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(175, 55),
                          primary: Colors.blueGrey,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                      )
                  ),
                ),
                SizedBox(height: 40,),
                SizedBox(
                  height: 80,
                  width: 300,
                  child: ElevatedButton(onPressed: () {
                    // Enter your code here what happen after submetting...............................................................................
                    Navigator.pushNamed(context, "/10");
                  }, child: Text("Customer Packages",style: TextStyle(fontSize: 20),),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(175, 55),
                          primary: Colors.blueGrey,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                      )
                  ),
                ),


              ],
            ),
          )),
    );
  }
}
