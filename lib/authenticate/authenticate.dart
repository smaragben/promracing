import 'package:flutter/material.dart';
import 'package:promracing/signin.dart';





class Authenticate extends StatelessWidget {
   Authenticate({ Key? key }) : super(key: key);
     static const  String routeName= '/Authenticate' ;

  @override
 Widget build(BuildContext context) {
    
    return
      Scaffold(
                    backgroundColor: Colors.white,
                    body: SignIn()
                  ) ;
  }
  }
