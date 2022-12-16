import 'dart:core';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/*setting up firebase*/
FirebaseFirestore firestore = FirebaseFirestore.instance;

/* General */
//TODO Login
String login(String email, String password) {
  String typeOfuser = "";
  firestore
      .collection("customer")
      .where("email", isEqualTo: email)
      .where("password", isEqualTo: password)
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      typeOfuser = "customer";
    });
  });

  firestore
      .collection("employee")
      .where("email", isEqualTo: email)
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      typeOfuser = "employee";
    });
  });

  return typeOfuser;
}

//Register
Future register(String name, String email, String password, String country,
    String reigon, String city, String zipcode) async {
  final customer = firestore.collection('customer').doc(email);
  final jsonCustomer = {
    'name': name,
    'email': email,
    'password': password,
    'city': city,
    'country': country,
    'reigon': reigon,
    'zipcode': zipcode
  };

  // adding the data
  await customer.set(jsonCustomer);
}

/* Employee */
//  Report
//TODO Type Report
//TODO categories/locations/status Report
//TODO Customer packages Report
//TODO lost/delayed/delivered Report
//TODO Payment Report
List<List<String>> getPaymentReport() {
  List<List<String>> list = [];
  print("----------start-----------");
  firestore
      .collection('customer own ')
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      list.add([doc["email"], doc["package number"]]);
    });
  });
  return list;
}

//    Package
//Add Package
Future addPackage(
    String weight,
    String insuranceAmount,
    String country,
    String reigon,
    String city,
    String zipcode,
    String height,
    String width,
    String length,
    String finalDeliveryDate,
    String packageCategory) async {
  final package = firestore.collection(' shipped packages').doc();
  final jsonPack = {
    'barcode': "123123",
    'city': city,
    'country': country,
    'current package status': "pending",
    'final delivery date': finalDeliveryDate,
    'fines': "30",
    'hight': height,
    'id': package.id,
    'insurance amount': insuranceAmount,
    'length': length,
    'package category': packageCategory,
    'reigon': reigon,
    'weight': weight,
    'width': width,
    'zipcode': zipcode
  };

  // adding the data
  await package.set(jsonPack);
}

//Edit Package
void editPackage(
    String id,
    String weight,
    String insuranceAmount,
    String country,
    String reigon,
    String city,
    String zipcode,
    String height,
    String width,
    String length,
    String finalDeliveryDate,
    String packageCategory) {
  final toEditPackage = firestore.collection(' shipped packages').doc(id);
  toEditPackage.update({
    'barcode': "123123",
    'city': city,
    'country': country,
    'current package status': "pending",
    'final delivery date': finalDeliveryDate,
    'fines': "30",
    'hight': height,
    'insurance amount': insuranceAmount,
    'length': length,
    'package category': packageCategory,
    'reigon': reigon,
    'weight': weight,
    'width': width,
    'zipcode': zipcode
  });
}

//Delete Package
void deletePackage(String packageID) {
  final notWantedPackage =
      firestore.collection(' shipped packages').doc(packageID);
  notWantedPackage.delete();
}
//TODO Trace Packages

//    Customer
//Add Customer
Future addCustomer(String name, String email, String password, String country,
    String reigon, String city, String zipcode) async {
  final customer = firestore.collection('customer').doc(email);
  final jsonCustomer = {
    'name': name,
    'email': email,
    'password': password,
    'city': city,
    'country': country,
    'reigon': reigon,
    'zipcode': zipcode
  };

  // adding the data
  await customer.set(jsonCustomer);
}

//Edit Customer
void editCustomer(String email, String name, String country, String city,
    String reigon, String zipcode) {
  final toEditCustoemr = firestore.collection('customer').doc(email);
  toEditCustoemr.update({
    'name': name,
    'email': email,
    'city': city,
    'country': country,
    'reigon': reigon,
    'zipcode': zipcode
  });
}

// Delete Customer
void deleteCustomer(String email) {
  final notWantedCustoemr = firestore.collection('customer').doc(email);
  notWantedCustoemr.delete();
}

//TODO Send Email
void sendEmail(String email) {
  String url = "mailto:$email?subject=Your package &body=your package is ready";
  launch(url);
}

/* User*/
//Your Packages
Future<List> getPackages(String email) async {
  Future<List<String>> packagesIDs = getUserPackagsIDs(email);
  Future<String> statusList;
  List<List<String>> statusAndID = [];

  for (String id in await packagesIDs) {
    statusList = getPackagsStatus(id);
    statusAndID.add([id, await statusList]);
  }

  return statusAndID;
}

//Send Package
Future sendPackage(
    String receiverEmail,
    String weight,
    String insuranceAmount,
    String country,
    String reigon,
    String packageCategory,
    String city,
    String zipcode,
    String height,
    String width,
    String length,
    String finalDeliveryDate) async {
  final package = firestore.collection(' shipped packages').doc();
  final jsonPack = {
    'barcode': "123123",
    'city': city,
    'country': country,
    'current package status': "pending",
    'final delivery date': finalDeliveryDate,
    'fines': "30",
    'hight': height,
    'id': package.id,
    'insurance amount': insuranceAmount,
    'length': length,
    'package category': packageCategory,
    'reigon': reigon,
    'weight': weight,
    'width': width,
    'zipcode': zipcode
  };

  final customerSend = firestore
      .collection('customer send ')
      .doc(receiverEmail + " " + package.id + " " + "123123");
  final jsonCustomerSend = {
    'barcode': "123123",
    'email': receiverEmail,
    'package number': package.id,
  };

  // adding the data
  await package.set(jsonPack);
  await customerSend.set(jsonCustomerSend);
}

//Update Information
void updateInformation(String email, String name, String password,
    String country, String city, String reigon, String zipcode) {
  final toEditCustoemr = firestore.collection('customer').doc(email);
  toEditCustoemr.update({
    'name': name,
    'password': password,
    'email': email,
    'city': city,
    'country': country,
    'reigon': reigon,
    'zipcode': zipcode
  });
}

//Pay
void pay(String email, String packageID) {
  final customerOwnToEdit =
      firestore.collection('customer own ').doc(email + " " + packageID);
  customerOwnToEdit.update({'pay status': "payed"});
}

// for refrence
void ttest() {
  FirebaseFirestore.instance
      .collection(' shipped packages')
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      print("--------------------------------------");
      print(doc["city"]);
    });
  });
}

// new methods

Future<List<String>> getPaymentPackagsID() async {
  List docList = [];
  List customerOwnList = [];
  List<String> packagesIds = [];
  List<String> packagesStatus = [];

  await Future.delayed(Duration(seconds: 5));

  try {
    final CollectionReference customerOwn =
        firestore.collection('customer own ');
    await customerOwn.get().then((value) {
      // print(value.docs.toList());

      for (final child in value.docs) {
        docList.add(child.id);
      }
    });

    for (final index in docList) {
      final docRef = customerOwn.doc(index);
      customerOwnList.add(await docRef.get().then((DocumentSnapshot doc) {
        // print(doc.data());
        final docData = doc.data();
        return docData;
      }));
    }
    // print(docList);
    // print(customerOwnList);

    // adding all the ids for the payed packages
    for (var json in customerOwnList) {
      final Map<String, dynamic> customerOwn = json;
      // print("here");
      packagesIds.add(customerOwn['package number']);
    }

    // final CollectionReference shippedPackages =
    //     firestore.collection(' shipped packages');
    //
    // for (String id in packagesIds) {
    //   shippedPackages.where("is", isEqualTo: id).get().then((value) {
    //     value.docs.forEach((element) {
    //       packagesStatus.add(element['current package status']);
    //     });
    //   });
    // }

    return await packagesIds;
  } catch (e) {
    print(e.toString());
    throw ('sth is wrong');
  }
}

Future<String> getPackagsStatus(String id) async {
  List docList = [];
  List jsonList = [];

  await Future.delayed(Duration(seconds: 5));

  try {
    final CollectionReference shippedPackages =
        firestore.collection(' shipped packages');
    await shippedPackages.where("id", isEqualTo: id).get().then((value) {
      // print(value.docs.toList());

      for (final child in value.docs) {
        docList.add(child.id);
      }
    });

    for (final index in docList) {
      final docRef = shippedPackages.doc(index);
      jsonList.add(await docRef.get().then((DocumentSnapshot doc) {
        // print(doc.data());
        final docData = doc.data();
        return docData;
      }));
    }

    // for (String id in packagesIds) {
    //   shippedPackages.where("is", isEqualTo: id).get().then((value) {
    //     value.docs.forEach((element) {
    //       packagesStatus.add(element['current package status']);
    //     });
    //   });
    // }
    String status = "";
    for (var json in jsonList) {
      status = json["current package status"];
    }

    print(docList);
    print(jsonList);
    return await status;
  } catch (e) {
    print(e.toString());
    throw ('sth is wrong');
  }
}

Future<List<String>> getUserPackagsIDs(String email) async {
  List docList = [];
  List customerOwnList = [];
  List<String> packagesIds = [];
  List<String> packagesStatus = [];

  await Future.delayed(Duration(seconds: 5));

  try {
    final CollectionReference customerOwn =
        firestore.collection('customer own ');
    await customerOwn.where("email", isEqualTo: email).get().then((value) {
      // print(value.docs.toList());

      for (final child in value.docs) {
        docList.add(child.id);
      }
    });

    for (final index in docList) {
      final docRef = customerOwn.doc(index);
      customerOwnList.add(await docRef.get().then((DocumentSnapshot doc) {
        // print(doc.data());
        final docData = doc.data();
        return docData;
      }));
    }
    // print(docList);
    // print(customerOwnList);

    // adding all the ids for the payed packages
    for (var json in customerOwnList) {
      final Map<String, dynamic> customerOwn = json;
      // print("here");
      packagesIds.add(customerOwn['package number']);
    }

    // final CollectionReference shippedPackages =
    //     firestore.collection(' shipped packages');
    //
    // for (String id in packagesIds) {
    //   shippedPackages.where("is", isEqualTo: id).get().then((value) {
    //     value.docs.forEach((element) {
    //       packagesStatus.add(element['current package status']);
    //     });
    //   });
    // }

    return await packagesIds;
  } catch (e) {
    print(e.toString());
    throw ('sth is wrong');
  }
}

Future<List<List<String>>> getPaymentPackagsIDandStatus() async {
  List docList = [];
  List customerOwnList = [];
  List<String> packagesIds = [];
  List<List<String>> packagesIdStatus = [];

  await Future.delayed(Duration(seconds: 5));

  try {
    final CollectionReference customerOwn =
        firestore.collection('customer own ');
    await customerOwn.get().then((value) {
      // print(value.docs.toList());

      for (final child in value.docs) {
        docList.add(child.id);
      }
    });

    for (final index in docList) {
      final docRef = customerOwn.doc(index);
      customerOwnList.add(await docRef.get().then((DocumentSnapshot doc) {
        // print(doc.data());
        final docData = doc.data();
        return docData;
      }));
    }
    // print(docList);
    // print(customerOwnList);

    // adding all the ids for the payed packages
    for (var json in customerOwnList) {
      final Map<String, dynamic> customerOwn = json;
      // print("here");
      packagesIds.add(customerOwn['package number']);
    }

    for (var i in await packagesIds) {
      packagesIdStatus.add([i, (await getPackagsStatus(i)).toString()]);
    }

    return await packagesIdStatus;
  } catch (e) {
    print(e.toString());
    throw ('sth is wrong');
  }
}
