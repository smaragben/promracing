import 'package:firebase_auth/firebase_auth.dart';
import 'package:promracing/user.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  appUser? createuser(User? fireuser ){
    return fireuser !=null ?  appUser(uid: fireuser.uid) : null;
  }

 Stream<appUser?> get user {
   print(createuser);
   return _auth.authStateChanges().map(createuser);
 }

  Future signinanon() async {
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      print(createuser(user));
      return  createuser(user);
    } catch(e) {
      print(e.toString());
      return null;

    }
  }
  Future signOut() async {
    try{
      print("hr");
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }


}