import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum Status { Uninitialized, Authenticating, Authenticated, Unauthenticated }

class UserProvider extends ChangeNotifier {
  FirebaseAuth _auth;
  FirebaseUser _firebaseUser;
  Status _status = Status.Uninitialized;
  Status get status => _status;
  FirebaseUser get firebaseUser => _firebaseUser;
  Firestore _fireStore = Firestore.instance;
  UserProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.onAuthStateChanged.listen(onStateChange);
  }
  Future<bool> signIn(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future<bool> signUp(String name, String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) {
        _fireStore
            .collection("users")
            .document(firebaseUser.uid)
            .setData({"email": email, "name": name, "uid": firebaseUser.uid});
      });
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future signOut() async {
    await _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<void> onStateChange(FirebaseUser user) async {
    if (user == null) {
      _status = Status.Unauthenticated;
    } else {
      _firebaseUser = user;
      _status = Status.Authenticated;
    }
    notifyListeners();
  }
}
