import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHalper {
  static FirebaseHalper fire = FirebaseHalper();

  FirebaseAuth auth=FirebaseAuth.instance;

  Future<String> anonymous_login()
  async {
    try
    {
      await auth.signInAnonymously();
      return "success";
    }
    catch(e)
    {
      return "Failed";
    }
  }

  bool check_user()
   {
    User? user=auth.currentUser;
    return user!=null;
  }

  Future<void> user_logout()
  async {
    await auth.signOut();
  }
}
