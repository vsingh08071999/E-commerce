import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseAuth {
  Future<FirebaseUser> googleSignIn();
}

class Auth implements BaseAuth {
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Future<FirebaseUser> googleSignIn() async {
    // TODO: implement googleSignIn
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication authentication =
        await googleSignInAccount.authentication;
    final AuthCredential credential = await GoogleAuthProvider.getCredential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken);
    try {
      AuthResult result = await _auth.signInWithCredential(credential);
      FirebaseUser firebaseUser = result.user;
      return firebaseUser;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
