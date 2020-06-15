import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_auth/models/profile.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference profileCollection =
      Firestore.instance.collection('profile');

  Future createInitProfile(
      String name, String email, String phoneNumber) async {
    return await profileCollection
        .document(uid)
        .setData({'name': name, 'email': email, 'phoneNumber': phoneNumber});
  }

  //get profile stream
  Stream<List<Profile>> get profiles {
    return profileCollection.snapshots()
    .map(_profileListFromSnapshot);
  }

  List<Profile> _profileListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Profile(
        name: doc.data['name'] ?? '',
        email: doc.data['email'] ?? '',
        phoneNumber: doc.data['phoneNumber'] ?? ''
      );
    }).toList();
  }
}
