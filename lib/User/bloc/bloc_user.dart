import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_trips/User/repository/auth_repository.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'dart:async';

class UserBloc implements Bloc {
  final _authRepository = AuthRepository();

  //**
  // Flujo de datos - Streams
  // Streams - FireBase/
  // StreamController
  // *
  Stream<User?> streamFirebase = FirebaseAuth.instance
      .authStateChanges(); //Establece o instancia que se requiere conocer el estado de la sesion en Firebase

  Stream<User?> get authStatus =>
      streamFirebase; //Devuelve el estado de la sesion

  Future<User?> currentUser() {
    return _authRepository.currentUser();
  }

  //Casos de Uso
  //1. SignIn a la aplicación Google
  Future<UserCredential?> signIn() {
    return _authRepository.signInFirebase();
  }

  signOut() {
    _authRepository.signOut();
  }

  @override
  void dispose() {}
}
