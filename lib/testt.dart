import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<List<dynamic>> newsCollection2() async {
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
