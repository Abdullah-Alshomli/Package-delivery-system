import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Login.dart';
import 'databaseUtility.dart';
import 'testt.dart';
import 'EPaymentReport.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  print("__________________________________________________________________");
  print(await getPackages("email@gmail.com"));
  print("__________________________________________________________________");
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        //main UI pages
        '/': (context) => Login(),
        '/12': (context) => EPaymentReport(),
        //'/0': (context) => Sign(),

        /* //Customer UI pages
        '/1': (context) => CControl(),
        '/2': (context) => CPackages(),
        '/3': (context) => CSendPackage(),
        '/4': (context) => CUpdateInformation(),
        '/5': (context) => CPay(),
        //Employee UI main
        '/6': (context) => EControl(),
        //Employee UI pages1
        '/7': (context) => EReport(),
        '/8': (context) => ETypeReport(),
        '/9': (context) => ECLSReport(),
        '/10': (context) => EViewCustomeerPackages(),
        '/11': (context) => ELDDReport(),
        '/12': (context) => EPaymentReport(),
        //Employee UI pages2
        '/13': (context) => EPackages(),
        '/14': (context) => EAddPackages(),
        '/15': (context) => EEditPackages(),
        '/16': (context) => EPackagesInfo(),
        //Employee UI pages3
        '/17': (context) => ECustomers(),
        '/18': (context) => ESendEmail(),
        '/19': (context) => EEditCustomer(),
        '/20': (context) => EAddCustomer(),*/
      },
      debugShowCheckedModeBanner: false,
      initialRoute: '/12',
    );
  }
}
