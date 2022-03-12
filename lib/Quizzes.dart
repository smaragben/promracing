import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:promracing/results.dart';
import 'package:promracing/services/auth.dart';
import 'package:promracing/theme.dart';
import 'dart:developer';

class Quizzes extends StatefulWidget {
  const Quizzes({Key? key,}) : super(key: key);
 
  static const String routeName = "/Quizzes";
  @override

 _Quizzes createState() => new _Quizzes();
}


 class _Quizzes extends State<Quizzes> {
 final AuthService _auth = AuthService();
  final controller = ScrollController();
  double idx = 0;
   var chosen = List<int>.generate(6, (index) => 0);
   var colors = List<Color>.generate(6, (index)=> Colors.grey);
   var borders = List<double>.generate(6, (index)=> 1.0);
  double points = 0;
  double counter = 0;
      @override

    Widget build(BuildContext context) {
      
    return 
    Scaffold(
                    backgroundColor: Colors.white,
                    body: Column(
     
                        children: wrapper(context, quiz(controller, chosen, colors), _auth, 3),
                        )
                  ) ;
  
  }

  

Widget _buildQuiz(QuerySnapshot? snapshot, controller, chosen, colors) {
  return ScrollConfiguration(
    behavior: scrollbehaviour(), 
    child: ListView.builder(
    dragStartBehavior: DragStartBehavior.down,
    scrollDirection: Axis.horizontal,
    
    controller: controller,
    itemCount: snapshot?.docs.length ?? 0,
    itemBuilder: (context, index){
      final doc = snapshot?.docs[index];
      final numopt = doc!["numoptions"];
      final corans = List<int>.generate(6, (index) => index<numopt+1 ? (index !=0 ? doc["option${index}cor"] :0) :  0);
for(int i = 0; i< 6 ; i++){
      log(corans[i].toString());

      }
  double idx = 0;
      return 
                        Container( 
                          alignment: Alignment.center,   
                          width: MediaQuery.of(context).size.width, 
                          child: Column(
                      children: <Widget>[Container(
                            height: 100,
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            child:Text(doc["question"])
                         
                          ),
                           Container(
                            height: 300,
                            width:  MediaQuery.of(context).size.height,
                            child:  ListView.builder(
                              scrollDirection: Axis.vertical,
    itemCount: doc["numoptions"],
    itemBuilder: (context, i){
      var num = i+1;
                       return Column(children: [
                        Container(
                            alignment: Alignment.center,
                            width: 150,
                            
                            child: ListTile(
                              onTap: () async { setState(() {
                                  if(chosen[num]==1){
                                          chosen[num] = 0; colors[num] = Colors.grey;
                                          borders[num] = 1.0;

                                  }
                                  else {
                                          chosen[num] = 1; colors[num] = Colors.red;
                                          borders[num] = 2.0;

                                  }

                                         }); }, 
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0), side: BorderSide(color: colors[num], width: borders[num])),
                              title: Text(doc["option$num"],  style: const TextStyle(fontSize: 10, color: Colors.black, fontWeight: FontWeight.w700,), )
                            )
                            ),

                         SizedBox(height: MediaQuery.of(context).size.height/20)

                       ],); 
    }
                       ),

                          ),
                           SizedBox(height: MediaQuery.of(context).size.height/20),

                           ElevatedButton(
                         style: ButtonStyle(maximumSize: MaterialStateProperty.all(Size(1*MediaQuery.of(context).size.width/3, 40.0)), backgroundColor: MaterialStateProperty.all(Colors.red), ),

                      child:Row(children:[ Text("  Επόμενο"), Icon(Icons.navigate_next ),]),  
                      onPressed: () {
                         idx+= MediaQuery.of(context).size.width; next(controller, idx, corans);
                          },),

                            ], 
                          )
                          
                        
                       
                           
                    
                    );
    }
  )
    
    ); 
    }


    void next(controller, idx, corans){
      setState(() {
        var wrong = false;
        for(int i =0 ; i<6; i++){

            chosen[i] = 0; colors[i] = Colors.grey;
            borders[i] = 1.0;
            if(chosen[i] != corans[i]){
              wrong = true;
            }
        }
        if(!wrong) {
          points +=1;
        }
          counter+=1;

        if(counter == 2){
          log("end");
          points = points/counter;
           Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2)=> Result(points: points), transitionDuration: Duration.zero, reverseTransitionDuration: Duration.zero));

        }
     
        });
      controller.animateTo(idx, duration: Duration(seconds: 1), curve: Curves.easeIn);

    }
     quiz(controller, chosen, colors){
   List<Map<dynamic, dynamic>> lists = [];
  final dbRef = FirebaseFirestore.instance.collection("quiz");

   return   StreamBuilder<QuerySnapshot>(
     stream : dbRef.snapshots(),
     builder: (context, snapshot) {
       if(snapshot.hasData){
         return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){return _buildQuiz(snapshot.data, controller, chosen, colors); }); 
       }
       
       return const LinearProgressIndicator();
     }
   );

}



}



class scrollbehaviour extends MaterialScrollBehavior{
  @override
  Set<PointerDeviceKind> get dragDevices=> {
    
  };
}



