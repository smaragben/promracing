import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:promracing/services/auth.dart';
import 'package:promracing/signin.dart';
import 'package:promracing/theme.dart';
import 'package:promracing/cardlist.dart';
import 'package:promracing/user.dart';

import 'package:promracing/wrapper.dart';
import 'package:provider/provider.dart';
import 'dart:developer';




class Profile extends StatelessWidget {
   Profile({Key? key, required this.a}) : super(key: key);
  AuthService a ;
  static const  String routeName= '/Profile' ;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<appUser?>(context);
    if(user == null){
      log("null");
    }
    return
      Scaffold(
                   resizeToAvoidBottomInset:false,
                    backgroundColor:  Color.fromARGB(234, 79, 79, 83),

                    body: Center(child: Column(
     
                        children: [
             SizedBox(height: MediaQuery.of(context).size.height/5 ),

                          IconButton(
            iconSize: 150,
            padding: const EdgeInsets.all(0),
            highlightColor: Colors.transparent,
            onPressed: (){},
            splashColor: Colors.transparent,
            icon: Image.asset(
            'assets/profilepic.png', 
            width: 150,
            height: 150,                                                            
            fit: BoxFit.fill),),
                                           SizedBox(height: MediaQuery.of(context).size.height/200),

    Text( "anonymous", style: TextStyle(color: Colors.white),),
                                               SizedBox(height: MediaQuery.of(context).size.height/200),

                                ElevatedButton(
                         style: ButtonStyle(maximumSize: MaterialStateProperty.all(Size(2*MediaQuery.of(context).size.width/3, 40.0)), backgroundColor: MaterialStateProperty.all(Colors.red), 

                             
                              ),
 
                      child: Row(children:[Icon(Icons.camera_alt ), Text("  Λήψη Φωτογραφίας Προφίλ")]), 
                      onPressed: () {
                      
                      },),
                       ElevatedButton(
                         style: ButtonStyle(maximumSize: MaterialStateProperty.all(Size(2*MediaQuery.of(context).size.width/3, 40.0)), backgroundColor: MaterialStateProperty.all(Colors.red), ),

                      child:Row(children:[Icon(Icons.photo_album ), Text("  Αναζήτηση φωτογραφίας")]),  
                      onPressed: () {
                          },),
                                                         SizedBox(height: MediaQuery.of(context).size.height/4 ),

                       ElevatedButton(
                         style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(5*MediaQuery.of(context).size.width/6, 40.0)), backgroundColor: MaterialStateProperty.all(Colors.red), shape:  MaterialStateProperty.all<RoundedRectangleBorder>(

                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))),
                              ),
 
                      child: Text("Έξοδος"), 
                      onPressed: () async{
                        await a.signut();
                      Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context)=> SignIn(a: a)));
                      },)
                    ]),
                    ),
                    
                  ) ;
  }
}

