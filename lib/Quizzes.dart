import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:math';
import 'package:promracing/theme.dart';
import 'package:promracing/logo.dart';
import 'package:promracing/buttons.dart';
import 'package:promracing/cardlist.dart';
import 'package:promracing/Quizzes.dart';
import 'package:promracing/mainpagewidget.dart';


class Quizzes extends StatefulWidget {
  const Quizzes({Key? key,}) : super(key: key);
 
  static const String routeName = "/Quizzes";
  @override

 _Quizzes createState() => new _Quizzes();
}


 class _Quizzes extends State<Quizzes> {

      @override

    Widget build(BuildContext context) {
    return 
     Container(
         decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
              'assets/background.png'), 
              fit: BoxFit.cover,
              
            )
          ),
 
          child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Column(
      children: [
       Container(
          
            child:  logo(context),),
       const SizedBox(
   height:10.0,),
       SizedBox(
              height: 34.0,
              child: ListView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                children: [
                            const Center(
                              child:  const Text("title") ),
                            
                       
                ]
              ), 
            ),
       const SizedBox(
   height:10.0,),
  
              
      ],
      
      )
                  )
      ); 
  
  }

}