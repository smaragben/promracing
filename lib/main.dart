import 'package:promracing/profile.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:promracing/mainpagewidget.dart';
import 'package:promracing/Quizzes.dart';
import 'package:promracing/services/auth.dart';
import 'package:promracing/wrapper.dart';
import 'package:promracing/user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp =  Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   var routes = <String, WidgetBuilder>{
     MainPageWidget.routeName: (BuildContext context) => const MainPageWidget() ,
     Quizzes.routeName: (BuildContext context) => const Quizzes(),
          Profile.routeName: (BuildContext context) => const Profile(),

   };
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      home: FutureBuilder(
        future: _fbApp,
        builder: (context,snapshot){
          if(snapshot.hasError){
            print("You have an error ${snapshot.error.toString()}...");
            return const Text('Something went wrong!');
          }else if(snapshot.hasData) {
            return StreamProvider<appUser?>.value(
              value: AuthService().user,
              initialData: null,
              child:  Wrapper());
   
          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          }
    
      
      
      
      
      ,),
    routes: routes,
      );
      
      
    
  }
}


