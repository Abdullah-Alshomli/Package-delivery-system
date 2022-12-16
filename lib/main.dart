import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Login.dart';
import 'databaseUtility.dart';
import 'testt.dart';
import 'Screens/Reports/EPaymentReport.dart';
import 'Sign.dart';
import 'Screens/Customer/CControl.dart';
import 'Screens/Customer/CPackages.dart';
import 'Screens/Customer/CPay.dart';
import 'Screens/Customer/CSendPackage.dart';
import 'Screens/Customer/CUpdateInformation.dart';
import 'Screens/Employee/EControl.dart';
import 'Screens/Employee/EPackages.dart';
import 'Screens/Reports/EReport.dart';
import 'Screens/Employee/EAddPackages.dart';
import 'Screens/Employee/EEditPackages.dart';
import 'Screens/Employee/ETracePackages.dart';
import 'Screens/Employee/ECustomer.dart';
import 'Screens/Employee/ESendEmail.dart';
import 'Screens/Employee/EEditCustomer.dart';
import 'Screens/Employee/EAddCustomer.dart';
import 'Screens/Reports/EViewCustomerPackages.dart';
import 'Screens/Reports/EPaymentReport.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  print("__________________________________________________________________");
  print(await getCostomers());
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
        '/0': (context) => Sign(),
        //Customer UI pages
        '/1': (context) => CControl(),
        '/2': (context) => CPackages(),
        '/3': (context) => CSendPackage(),
        '/4': (context) => CUpdateInformation(),
        '/5': (context) => CPay(),
        //Employee UI main
        '/6': (context) => EControl(),

        //Employee UI pages1
        '/7': (context) => EReport(),

        //Employee UI pages2
        '/13': (context) => EPackages(),
        '/14': (context) => EAddPackages(),
        '/15': (context) => EEditPackages(),
        '/16': (context) => ETracePackages(),

        //Employee UI pages3
        '/17': (context) => ECustomers(),
        '/18': (context) => ESendEmail(),
        '/19': (context) => EEditCustomer(),
        '/20': (context) => EAddCustomer(),

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
        '/12': (context) => EPaymentReport(),
      },

      debugShowCheckedModeBanner: false,
      initialRoute: '/',
    );
  }
}
