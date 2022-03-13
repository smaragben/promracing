import 'package:flutter/material.dart';
import 'package:promracing/services/auth.dart';
import 'package:promracing/theme.dart';
import 'package:promracing/cardlist.dart';


class MainPageWidget extends StatefulWidget {
  const MainPageWidget({Key? key}) : super(key: key);
  static const String routeName = "/MainPage";
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _MainPageWidgetState();
  
  
}

class _MainPageWidgetState extends State<MainPageWidget> {
 final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    return
      Scaffold(
              resizeToAvoidBottomInset:false,

                    backgroundColor: Colors.white,
                    body: Column(
     
                        children: wrapper(context, cards1(), _auth, 1),
                        )
                  ) ;
  }
}













