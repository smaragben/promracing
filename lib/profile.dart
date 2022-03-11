import 'package:flutter/material.dart';
import 'package:promracing/services/auth.dart';
import 'package:promracing/theme.dart';
import 'package:promracing/cardlist.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  static const String routeName = "/Profile";
  @override
  // ignore: no_logic_in_create_state
  _ProfileState createState() => _ProfileState();
  
  
}

class _ProfileState extends State<Profile> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    return
      Scaffold(
                    backgroundColor: Colors.white,
                    body: Center( child: ElevatedButton(
                      child: Text("sign out"), 
                      onPressed: () async{
                        await _auth.signOut();

                      },)
                    )
                  ) ;
  }
}













