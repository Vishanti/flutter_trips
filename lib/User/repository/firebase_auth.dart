import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI {
  // Create an instance of the firebase auth and google signin
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<UserCredential?> signInWithGoogle() async {
    GoogleSignInAccount? googleSignInAccount;
    try {
      //Triger the authentication flow
      googleSignInAccount = await googleSignIn.signIn();
    } catch (e) {
      print("Error al mostrar la ventana de cuentas de Google: error: $e");
    }

    if (googleSignInAccount != null) {
      GoogleSignInAuthentication? googleAuthentication;
      try {
        //Obtain the auth details from the request
        googleAuthentication = await googleSignInAccount.authentication;
      } catch (e) {
        print(
            "Error al obtener las credenciales de la cuenta de Google: error: $e");
      }
      if (googleAuthentication != null) {
        AuthCredential? credential;
        try {
          //Create a new credentials
          credential = GoogleAuthProvider.credential(
            accessToken: googleAuthentication.accessToken,
            idToken: googleAuthentication.idToken,
          );
        } catch (e) {
          print("Objeto credentials vacio");
        }
        if (credential != null) {
          try {
            //Sign in the user with the credentials
            UserCredential userCredential =
                await auth.signInWithCredential(credential);
            return userCredential;
          } catch (e) {
            print("Error al autenticar con firebase: error: $e");
          }
        }
      }
    }
    return null;
  }

  //Metodo para obtener el usuario actualmente logueado
  Future<User?> currentUser() async {
    return auth.currentUser;
  }

  //Metodo para cerrar la sesion en Firebase y Google
  signOut() async {
    await googleSignIn
        .signOut()
        .then((value) => print("Sesion de Google cerrada"));
    await auth.signOut().then((value) => print("Sesión de Firebase Cerrada"));
  }
}
