
import 'package:flutter/material.dart';
import 'package:promracing/authenticate/authenticate.dart';
import 'package:promracing/mainpagewidget.dart';
import 'package:provider/provider.dart';
import 'package:promracing/user.dart';


class Wrapper extends StatelessWidget {
   Wrapper({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
      final user = Provider.of<appUser?>(context);
      if(user == null)
    return Authenticate();
    else
    return MainPageWidget();
  }
}