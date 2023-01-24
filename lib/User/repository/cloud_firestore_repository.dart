import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_trips/User/model/user.dart';
import 'package:flutter_trips/User/repository/cloud_firestore_api.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(UserModel user) =>
      _cloudFirestoreAPI.updateUserData(user);
}
