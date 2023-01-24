import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_trips/User/repository/auth_repository.dart';
import 'package:flutter_trips/User/repository/cloud_firestore_repository.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'dart:async';
import 'package:flutter_trips/User/model/user.dart';

class UserBloc implements Bloc {
  final _authRepository = AuthRepository();

  //**
  // Flujo de datos - Streams
  // Streams - FireBase/
  // StreamController
  // *
  Stream<User?> streamFirebase = FirebaseAuth.instance
      .authStateChanges(); //Establece o instancia que se requiere conocer el estado de la sesion en Firebase

  //Casos de Uso
  //1. SignIn a la aplicación Google
  Future<UserCredential?> signIn() {
    return _authRepository.signInFirebase();
  }

  //**
  //Cierra sesión de usuario */
  signOut() {
    _authRepository.signOut();
  }

  //**
  //2. Registrar usuario en base de datos */
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(UserModel user) =>
      _cloudFirestoreRepository.updateUserDataFirestore(user);

  Stream<User?> get authStatus =>
      streamFirebase; //Devuelve el estado de la sesion

  Future<User?> currentUser() {
    return _authRepository.currentUser();
  }

  @override
  void dispose() {}
}
