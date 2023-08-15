import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopify/view/1home/model/home_model.dart';

class FireBaseHelper
{
  String userId="";

  static final fireBaseHelper = FireBaseHelper._();

  FireBaseHelper._();

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<String> guestSignIn()
  async {
    try {
      await auth.signInAnonymously();
      return "SignIn Successfully";
    } catch (e) {
      return "$e";
    }
  }

  bool checkUser() {
    User? user = auth.currentUser;
    return user != null;
  }

  Future<String> signInEmail(email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return "SignIn Successfully";
    } catch (e) {
      return "$e";
    }
  }

  Future<String> signUpEmail(email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "SignUp Successfully";
    } catch (e) {
      return "$e";
    }
  }

  Future<UserCredential> signInGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // Future<Future<UserCredential>> signInFacebook()
  // async {
  //   final LoginResult loginResult = await FacebookAuth.instance.login();
  //
  //   final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
  //
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }

  Future<String> signOut() async {
    try {
      await auth.signOut();
      return "SignOut Successfully";
    } catch (e) {
      return "$e";
    }
  }

  Map<String, String?> userDetails() {
    User? user = auth.currentUser;
      userId=user!.uid;
    return {
      "name": user!.displayName,
      "email": user.email,
      "phone": user.phoneNumber,
      "photo": user.photoURL,
    };
  }

  // ============================= FireBase FireStore ==============================

  //=======================home======================

  FirebaseFirestore firestore =FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> selectProduct()
  {
    return firestore.collection("products").snapshots();
  }

  //========================cart=======================

  Future<void> addToCart(HomeModel h1)
  async {
    print("===============================>>>> $userId");
    await firestore.collection("users").doc(userId).collection("cart").add({
      "name":h1.name,
      "subname":h1.subname,
      "price":h1.price,
      "image":h1.image,
    });
  }
}