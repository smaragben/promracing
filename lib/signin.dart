import 'package:flutter/material.dart';
import 'package:promracing/mainpagewidget.dart';
import 'package:promracing/services/auth.dart';
import 'package:promracing/wrapper.dart';


class SignIn extends StatefulWidget {
  const SignIn({ Key? key }) : super(key: key);
  static const  String routeName= '/Signin' ;

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
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> MainPageWidget()));

          print("user signed in");
        }
        },)
    );
  }
}