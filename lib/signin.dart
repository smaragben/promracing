import 'package:flutter/material.dart';
import 'package:promracing/services/auth.dart';


class SignIn extends StatefulWidget {
  const SignIn({ Key? key }) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(child: Text("signin anon"), onPressed: () async {
        dynamic user = await _auth.signinanon();
        if(user == null){
          print("error signing in");
        }
        else{
          print("user signed in");
        }
        },)
    );
  }
}