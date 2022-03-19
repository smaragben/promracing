import 'package:flutter/material.dart';
import 'package:promracing/mainpagewidget.dart';
import 'package:promracing/services/auth.dart';
import 'package:promracing/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  static const String routeName = '/Register';

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String password = "";
  String username = "";

  String email = "";
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(234, 71, 59, 59),
        body: Column(
          children: [
            SizedBox(height: 1 * MediaQuery.of(context).size.height / 4),
            Center(
                child: Image.asset('assets/image2.png', width: 80, height: 80)),
            SizedBox(height: MediaQuery.of(context).size.height / 20),
            Padding(
              padding: EdgeInsets.fromLTRB(35.0, 0, 35.0, 0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        textAlign: TextAlign.center,
                        cursorColor: Colors.grey,
                        decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15.0,
                              fontWeight: FontWeight.normal,
                            ),
                            focusColor: Colors.red,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(
                                    color: Colors.black, width: 5.0)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.0)),
                            labelText: 'Username...'),
                        style: TextStyle(color: Colors.white),
                        onChanged: (val) {
                          setState(() {
                            username = val;
                          });
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 30,
                      ),
                      TextFormField(
                        textAlign: TextAlign.center,
                        cursorColor: Colors.grey,
                        decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15.0,
                              fontWeight: FontWeight.normal,
                            ),
                            focusColor: Colors.red,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(
                                    color: Colors.black, width: 5.0)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.0)),
                            labelText: 'Email...'),
                        style: TextStyle(color: Colors.white),
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 30,
                      ),
                      TextFormField(
                        obscureText: true,
                        cursorColor: Colors.grey,
                        decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15.0,
                              fontWeight: FontWeight.normal,
                            ),
                            focusColor: Colors.red,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(
                                    color: Colors.black, width: 5.0)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.0)),
                            labelText: 'Password...'),
                        style: TextStyle(color: Colors.white),
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),
                    ],
                  )),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 20),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                      Size(5 * MediaQuery.of(context).size.width / 6, 40.0)),
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0))),
                ),
                child: Text("Εγγραφή"),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    dynamic result =
                        await _auth.register(email, password, username);
                    if (result == null) {
                      setState(() {
                        error = "Εισάγετε ορθό email";
                      });
                    } else {
                      log(result.uid);
                      Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  MainPageWidget(),
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero));
                    }
                  }
                },
              ),
            ),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Αν έχετε λογαριασμό",
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      )),
                  TextButton(
                    child: Text(" Είσοδος εδώ",
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 10,
                          color: Colors.white,
                        )),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  SignIn(),
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero));
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  Text(error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0)),
                ],
              ),
            )
          ],
        ));
  }
}
