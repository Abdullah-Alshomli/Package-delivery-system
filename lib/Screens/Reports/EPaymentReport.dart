import 'package:flutter/material.dart';
import '../../testt.dart';
//the needed varebails..............................................................
List<List<String>> packagesList =[];




class EPaymentReport extends StatefulWidget {
  const EPaymentReport({Key? key}) : super(key: key);

  @override
  State<EPaymentReport> createState() => _EPaymentReport();
}

class _EPaymentReport extends State<EPaymentReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(title: Text("Payment Report", style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 30),),centerTitle: true,backgroundColor: Colors.blueGrey,),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [

                Container(margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),height: 80,width: 400,child: ElevatedButton(onPressed: () async{
                  packagesList = await getPaymentPackagsIDandStatus();
                  setState(() {
                  });}, child: Text("Print Reports",style: TextStyle(fontSize: 30),),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(175, 55),
                        primary: Colors.blueGrey,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                    )
                ),),
                for(List<String> i in packagesList) Container(width: 1000,margin: EdgeInsets.only(bottom: 40,left: 10,right: 10),color: Colors.grey, child: Column(children: [Text("Package ID:",style: TextStyle(fontSize: 30),),Text(i[0],style: TextStyle(fontSize: 30)),SizedBox(height: 20,),Text("Package Status:",style: TextStyle(fontSize: 30)),Text(i[1],style: TextStyle(fontSize: 30))],),),





              ],
            ),
          )),
    );
  }
}
