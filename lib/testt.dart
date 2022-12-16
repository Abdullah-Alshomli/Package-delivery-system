import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<List<dynamic>> newsCollection2() async {
  List docList = [];
  List testNewList = [];

  await Future.delayed(Duration(seconds: 5));

  try {
    final CollectionReference news = firestore.collection('customer own ');
    await news.get().then((value) {
      // print(value.docs.toList());

      for (final child in value.docs) {
        docList.add(child.id);
      }
    });

    for (final index in docList) {
      final docRef = news.doc(index);
      testNewList.add(await docRef.get().then((DocumentSnapshot doc) {
        // print(doc.data());
        final docData = doc.data();
        return docData;
      }));
    }

    print(docList);
    print(testNewList);
    return await testNewList;
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


    for(var i in await packagesIds){
      packagesIdStatus.add([i,(await getPackagsStatus(i)).toString()]);
    }

    return await packagesIdStatus;
  } catch (e) {
    print(e.toString());
    throw ('sth is wrong');
  }
}



/*+++++++++++++++++++++++++
++++++++++++++++++++++++
+++++++++++++++++++++++
+++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++
++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

//TODO how to use Future
// funcThatReturnsFuture().then((result) {
//   print(result);
// })


Future<List<dynamic>> getCostomers() async {
  List docList = [];
  List testNewList = [];

  await Future.delayed(Duration(seconds: 5));

  try {
    final CollectionReference news = firestore.collection('customer');
    await news.get().then((value) {
      // print(value.docs.toList());

      for (final child in value.docs) {
        docList.add(child.id);
      }
    });


    return await docList;
  } catch (e) {
    print(e.toString());
    throw ('sth is wrong');
  }
}

Future<List<dynamic>> getEployees() async {
  List docList = [];
  List testNewList = [];

  await Future.delayed(Duration(seconds: 5));

  try {
    final CollectionReference news = firestore.collection('employee');
    await news.get().then((value) {
      // print(value.docs.toList());

      for (final child in value.docs) {
        docList.add(child.id);
      }
    });


    return await docList;
  } catch (e) {
    print(e.toString());
    throw ('sth is wrong');
  }
}