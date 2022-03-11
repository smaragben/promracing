
import 'package:flutter/material.dart';
import 'package:promracing/authenticate/authenticate.dart';
import 'package:promracing/mainpagewidget.dart';
import 'package:provider/provider.dart';
import 'package:promracing/user.dart';
import 'dart:developer';
import 'package:promracing/signin.dart';


class Wrapper extends StatelessWidget {
   Wrapper({ Key? key }) : super(key: key);
     static const  String routeName= '/Wrapper' ;

  @override
  Widget build(BuildContext context) {
      final user = Provider.of<appUser?>(context);
      log("kkkkkkkkkkkkk");
      if(user == null){
        log(user?.uid ?? "nnn");
            return SignIn() ;

      }
    else{
      log(user.uid);
    return MainPageWidget();

    }
  }
}