import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:promracing/user.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  appUser? createuser(User? fireuser , String? username){
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    if(username != null && fireuser!.uid != null) {
      String uid =fireuser.uid.toString();
      users.add({'uid': uid, 'username': username});
    }
    return fireuser !=null ?  appUser(uid: fireuser.uid) : null;
  }

 Stream<appUser?> get user {
   print(createuser);
         print("hhhhh");
   return _auth.authStateChanges().map((user) => createuser(user, null)); 
 }

  Future signinanon() async {
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      print(createuser(user, null));
      return  createuser(user, null);
    } catch(e) {
      print(e.toString());
      return null;

    }
  }

 Future signin(String email, String password) async {
   try{
      UserCredential result = await _auth.signInWithEmailAndPassword (email: email, password: password);
      User? user = result.user;
      return createuser(user, null);
      } catch(e){

    }
  }


  Future register( String email, String password, String usernamr) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return createuser(user, null);
      } catch(e){

    }

  }

  Future signOut() async {
    try{
      print("hr");
      await _auth.signOut();
      return ;
    }
    catch(e){
      print(e.toString());
      return ;
    }
  }


}