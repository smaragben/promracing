import 'package:flutter/material.dart';
import 'package:promracing/services/auth.dart';
import 'package:promracing/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Result extends StatefulWidget {
  const Result({Key? key, this.points}) : super(key: key);
  final points;
    static const String routeName = "/Result";

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _ResultState();
  
  
}

class _ResultState extends State<Result> {
 final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    return
      Scaffold(
                    backgroundColor: Colors.white,
                    body: Column(
     
                        children: wrapper(context, res(), _auth, 5),
                        )
                  ) ;
  }
  res()  {
    Widget message;
    int highscore = 1;
    if(widget.points < 0.5) {
      widget.points > highscore ? message = newhighscore() : message = bad(); 
      
    }
    else if(widget.points >0.5 && widget.points < 0.8) {
      widget.points > highscore ? message = newhighscore() : message = medium(); 
    }
    else{
      widget.points > highscore ? message = newhighscore() : message = great(); 
    }
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            message,
                        SizedBox(height: MediaQuery.of(context).size.height/20),

     Text("Your score is: ", style: TextStyle(color: Colors.red,  fontWeight: FontWeight.w700, fontSize: 17.0),),
      
            SizedBox(height: MediaQuery.of(context).size.height/50),

      Text(widget.points.toString()),
                  SizedBox(height: MediaQuery.of(context).size.height/50),

      Text("Your high score is: ", style: TextStyle(color: Colors.red,  fontWeight: FontWeight.w700, fontSize: 17.0),),
            SizedBox(height: MediaQuery.of(context).size.height/50),

   Text(widget.points.toString()),
               SizedBox(height: MediaQuery.of(context).size.height/50),

                  Text("Best score is: ", style: TextStyle(color: Colors.red,  fontWeight: FontWeight.w700, fontSize: 17.0),),
                              SizedBox(height: MediaQuery.of(context).size.height/50),


      Text(widget.points.toString()),


    ] ));
      }


      Widget bad() {
        return Column(children:[Image.asset('assets/2.png', width:200 ,height:200 ), Text("Μπορείς και καλύτερα,", style: TextStyle(color: Colors.red,  fontWeight: FontWeight.w700, fontSize: 20.0),),
        Text("προσπάθησε ξανά!", style: TextStyle(color: Colors.red,  fontWeight: FontWeight.w700, fontSize: 20.0)),]);
      }
      Widget medium() {
        return Text("Μπράβο!", style: TextStyle(color: Colors.black,  fontWeight: FontWeight.w700, fontSize: 20.0),);
      }
      Widget great() {
        return Text("Τέλειο!", style: TextStyle(color: Colors.black,  fontWeight: FontWeight.w700, fontSize:20.0),);
      }
      Widget newhighscore() {
        return Column(children: [Image.asset('assets/2.png', width:200 ,height:200 ), Text("Συγχαρητήρια έχεις το νέο high score!", style: TextStyle(color: Colors.green,  fontWeight: FontWeight.w700, fontSize: 20.0),)]);
      }
  
}
