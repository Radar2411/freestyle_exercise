import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirebaseAuthService {
  // FirebaseAuth instance
  final FirebaseAuth _fbAuth = FirebaseAuth.instance;
  Future<User> signIn({String email, String password}) async {
    try {
      UserCredential ucred = await _fbAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = ucred.user;
      print("Signed In successful! userid: $ucred.user.uid, user: $user.");
      return user;
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message, gravity: ToastGravity.TOP);
      return null;
    } catch (e) {
      print(e.message);
      return null;
    }
  } //signIn

  Future<User> signUp({String name, String email, String password}) async {
    try {
      UserCredential ucred = await _fbAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = ucred.user;
      user.updateProfile(displayName: name);
      print('Signed Up successful! user: $user');
      return user;
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message, gravity: ToastGravity.TOP);
      return null;
    } catch (e) {
      print(e.message);
      return null;
    }
  } //signUp

  Future<void> signOut() async {
    await _fbAuth.signOut();
  } //signOut

  //GET UID
  Future<String> getCurrentUID() async {
    return (_fbAuth.currentUser).uid;
  }

  //GET CURRENT USER
  Future getCurrentUser() async {
    return await _fbAuth.currentUser;
  }

  //UPDATE NAME
  Future<void> updateDisplayName(String displayName) async {
    var user = await _fbAuth.currentUser;

    user.updateProfile(
      displayName: displayName,
    );
  }

  //UPDATE EMAIL
  Future<void> updateEmail(String email) async {
    var user = await _fbAuth.currentUser;

    user.updateEmail(
      email,
    );
  }
} //FirebaseAuthService
