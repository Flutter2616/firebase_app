import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebaseapp/controller/login_controller.dart';
import 'package:firebaseapp/modal/product_modal.dart';
import 'package:firebaseapp/modal/user_modal.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'notification_service.dart';

class FirebaseHalper {
  static FirebaseHalper fire = FirebaseHalper();

  FirebaseAuth auth = FirebaseAuth.instance;
  Logincontroller login = Logincontroller();

  Future<String> anonymous_login() async {
    try {
      await auth.signInAnonymously();
      return "success";
    } catch (e) {
      return "Failed";
    }
  }

  bool check_user() {
    User? user = auth.currentUser;
    return user != null;
  }

  Future<void> user_logout() async {
    await auth.signOut();
    await GoogleSignIn().signOut();
  }

  Future<String> id_register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return 'success';
    } catch (e) {
      return '$e';
    }
  }

  Future<String> id_login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return 'success';
    } catch (e) {
      return '$e';
    }
  }

  Future<String> signin_google() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    try {
      await auth.signInWithCredential(credential);
      return "success";
    } catch (e) {
      return 'e';
    }
  }

  Usermodal user_detail() {
    User? user = auth.currentUser;

    Usermodal userdata = Usermodal(
        name: user!.displayName,
        email: user.email,
        img: user.photoURL,
        number: user.phoneNumber);
    return userdata;
  }

  String? number, verifyid, otp, status;

  Future<void> phone_Login(String number) async {
    print("number:${number}");
    await auth.verifyPhoneNumber(
      phoneNumber: '+919725381787',
      timeout: Duration(seconds: 30),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        String smsCode = '';
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);
        await auth.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  // Future<String> get_Otp(String otp) async {
  //   ConfirmationResult confirmationResult =
  //       await auth.signInWithPhoneNumber('+919313977271');
  //   try {
  //     UserCredential userCredential = await confirmationResult.confirm('$otp');
  //     return 'success';
  //   } catch (e) {
  //     return '$e';
  //   }
  // } //======================================= fire store======================

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void insertdata(ProductModal modal) {
    firestore.collection('products').add({
      "name": modal.name,
      "price": modal.price,
      "desc": modal.desc,
      "image": modal.image,
      "category": modal.category
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readdata() {
    return firestore.collection("products").snapshots();
  }

  void deletedata(String id) {
    firestore.collection('products').doc("$id").delete();
  }

  void update(ProductModal modal) {
    firestore.collection('products').doc("${modal.id}").set({
      "name": modal.name,
      "price": modal.price,
      "desc": modal.desc,
      "image": modal.image,
      "category": modal.category
    });
  }

  //=====================firebase messaging ================
  Future<void> iniMessage() async {
    final fcmtoken = await FirebaseMessaging.instance.getToken();
    print("fcm token:===${fcmtoken}");
    FirebaseMessaging.onMessage.listen((msg) {
      var notify = msg.notification;

      if (notify != null) {
        var title = notify.title;
        var body = notify.body;

        Notificationservice.service.fire_Notification(title: title, body: body);
      }
    });
  }
}
