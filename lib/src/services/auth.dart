import 'package:firebase_auth/firebase_auth.dart';
import 'package:routetobeselfttaught/src/providers/user.dart';

class AuthService {
//Get properties to sign in,register, etc for Firebase auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

// Create user obj based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

//Auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        //Map our specific user
        .map(_userFromFirebaseUser);
  }

  //Sign in Anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  // Sign in with email & pass
Future signInWithEmailAndPassword(String email,String pass) async {
  try {
    AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: pass);
    FirebaseUser user = result.user;
    return _userFromFirebaseUser(user);
  } catch (e) {
    print(e.toString());
    return null;
  }
}

  // Register with email & pass
Future registerWithEmailAndPassword(String email,String pass) async {
  try {
    AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
    FirebaseUser user = result.user;
    return _userFromFirebaseUser(user);
  } catch (e) {
    print(e.toString());
    return null;
  }
}

  //Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
