import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_trips/User/model/user.dart';

class CloudFirestoreAPI {
  final String uSers = "users";
  final String pLace = "place";

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> updateUserData(UserModel user) {
    DocumentReference ref = _db.collection(uSers).doc(user.uid);
    return ref.set({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now()
    }, SetOptions(merge: true));
  }
}
