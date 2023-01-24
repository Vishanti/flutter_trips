import 'firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final _firebaseAuthApi = FirebaseAuthAPI();
  Future<UserCredential?> signInFirebase() =>
      _firebaseAuthApi.signInWithGoogle();
  Future<User?> currentUser() => _firebaseAuthApi.currentUser();
  signOut() => _firebaseAuthApi.signOut();
}
