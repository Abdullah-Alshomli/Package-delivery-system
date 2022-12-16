import 'package:flutter/material.dart';

//the needed varebails..............................................................



class EControl extends StatefulWidget {
  const EControl({Key? key}) : super(key: key);

  @override
  State<EControl> createState() => _EControl();
}

class _EControl extends State<EControl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(title: Text("Employee Control", style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 30),),centerTitle: true, backgroundColor: Colors.blueGrey,),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [


                SizedBox(
                  height: 80,
                  width: 300,
                  child: ElevatedButton(onPressed: () {
                    // Enter your code here what happen after submetting...............................................................................
                    Navigator.pushNamed(context, "/13");
                  }, child: Text("Packages",style: TextStyle(fontSize: 20),),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(175, 55),
                        primary: Colors.blueGrey,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                SizedBox(
                  height: 80,
                  width: 300,
                  child: ElevatedButton(onPressed: () {
                    // Enter your code here what happen after submetting...............................................................................
                    Navigator.pushNamed(context, "/17");
                  }, child: Text("Customers Info",style: TextStyle(fontSize: 20),),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(175, 55),
                        primary: Colors.blueGrey,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                SizedBox(
                  height: 80,
                  width: 300,
                  child: ElevatedButton(onPressed: () {
                    // Enter your code here what happen after submetting...............................................................................
                    Navigator.pushNamed(context, "/7");
                  }, child: Text("Generate reports",style: TextStyle(fontSize: 20),),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(175, 55),
                        primary: Colors.blueGrey,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                    ),
                  ),
                ),
                SizedBox(height: 120,),
                SizedBox(
                  height: 60,
                  width: 200,
                  child: ElevatedButton(onPressed: () {
                    // Enter your code here what happen after submetting...............................................................................
                    Navigator.pushNamed(context, "/");
                  }, child: Text("Logout",style: TextStyle(fontSize: 20),),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(145, 55),
                        primary: Colors.red,
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
