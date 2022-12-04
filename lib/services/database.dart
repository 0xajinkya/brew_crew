import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;
  DatabaseService( {required this.uid });
  //Collection Reference
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');

  Future<dynamic>? updateUserData(String sugars, int strength, String name) async {
    return await brewCollection.doc(uid).set({
      "name": name,
      "sugars": sugars,
      "strength": strength,
    });
  }

  //Get Brews Stream
  Stream<QuerySnapshot> get brews{
    return brewCollection.snapshots();
  }
}