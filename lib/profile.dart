import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:promracing/services/auth.dart';
import 'package:promracing/signin.dart';
import 'package:promracing/theme.dart';
import 'package:promracing/cardlist.dart';

import 'package:promracing/wrapper.dart';





class Profile extends StatelessWidget {
   Profile({Key? key}) : super(key: key);
 final AuthService _auth = AuthService();
  static const  String routeName= '/Profile' ;

  @override
  Widget build(BuildContext context) {

    return
      Scaffold(
                    backgroundColor: Colors.white,
                    appBar: AppBar(actions: <Widget> [
                       ElevatedButton(
                      child: Text("sign out"), 
                      onPressed: () async{
                        await _auth.signOut();
                      Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context)=> SignIn()));
                      },)
                    ]),
                    
                    
                  ) ;
  }
}













