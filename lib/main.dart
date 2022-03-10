import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:math';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp =  Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      home: FutureBuilder(
        future: _fbApp,
        builder: (context,snapshot){
          if(snapshot.hasError){
            print("You have an error ${snapshot.error.toString()}...");
            return Text('Something went wrong!');
          }else if(snapshot.hasData) {
            return _cont();
          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          }
    
      
      
      
      
      ,)
     
      );
      
      
    
  }
}

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({Key? key}) : super(key: key);
  
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _MainPageWidgetState();
  
  
}

class _MainPageWidgetState extends State<MainPageWidget> {
  final _but = _buttons();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Container(
           padding:  const EdgeInsets.only(top:50.0),
            child:  _logos(context),),
       const SizedBox(
   height:10.0,),
       SizedBox(
              height: 34.0,
              child: ListView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                children: _but,
              ), 
            ),
       const SizedBox(
   height:10.0,),
   DefaultTextStyle(
     style: TextStyle(color: Colors.black, ),
   child: Container(
     child: Text('Tελευταία Νέα'),)),
   const SizedBox(
   height:5.0,),
              SizedBox(
              width: 340.0,
              height: 600.0,
              
              child: _cards1()//ListView(
              //  children: _cards(),
              ), 
      ],
      
      );
  }

}

_logos(context) {

  return Container(
  padding:const EdgeInsets.only(top:5.0),
  color: Colors.white,
  width: MediaQuery.of(context).size.width,
  height: 50.0,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      const SizedBox(width: 10),
      Align(
        alignment: Alignment.centerLeft, 
        child: Row(children: [
          Image.asset(
            'assets/Rectangle2.png', 
            width: 40,
            height: 40,                                                            
            fit: BoxFit.fill),
                Image.asset(
            'assets/Rectangle8.png', 
            width: 100,
            height: 40,                                                            
            fit: BoxFit.fill),
        ],) 
    
      ),
     const Spacer(),
      Align(
        alignment: Alignment.centerRight, 
        child: Row(children: [
          const Text('Profile'),
          const SizedBox(width: 10),
          _profilepic()
                
        ],) 
    
      ),
      const SizedBox(width: 10),


    ],)

  );
}


List<Widget> _buttons(){

  const List<Widget> _labels= [Text('News'), Text('Prom'), Text('Quizzes'), Text('Rules'), Text('Photos'), 
  Text('Sponsors'), Text('ContactUs') ]; 
  final List<Widget> _butt=[];
  const _space = SizedBox(width:10);
      _butt.add(_space);

  for (var i = 0; i<7; i++){
    _butt.add(_button(_labels[i], i+1));
    _butt.add(_space);
  }
  return _butt;
}

_button(text, index){
  return  ButtonTheme(
    minWidth: 0,
    height: 30,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    child: Container(
      margin: const EdgeInsets.all(0),
      child: ElevatedButton.icon(
                     style: ButtonStyle(
                       backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                       foregroundColor: MaterialStateProperty.all<Color>( Colors.white),
           
                        elevation: MaterialStateProperty.resolveWith(
                          (Set<MaterialState> states) {
                            if(states.contains(MaterialState.pressed) || states.contains(MaterialState.hovered)| states.contains(MaterialState.focused))
                              return 13;
                            else{
                                return 0;
                            }
                          }
                        ),
                  
               ),

                      onPressed: _pagenavigator,
                        icon:  Padding(
                          padding: const EdgeInsets.all(0),
                          child: Image.asset(
                            'assets/image$index.png',
                            height: 20.0,
                            width: 20.0,
                          ))  ,
                      label: Padding(padding: const EdgeInsets.all(0), child:text) ,
                             
                 
  
                    ),
   ) );
                      
                
}


_pagenavigator(){
}

_cont(){

return

  Container(
         decoration: BoxDecoration(
            image: const DecorationImage(
              image: const AssetImage(
              'assets/background.png'), 
              fit: BoxFit.cover,
              
            )
          ),
 
          child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: MainPageWidget()
                  )
      );
}





_profilepic(){

    
      return IconButton(
            iconSize: 50,
            padding: EdgeInsets.all(0),
            highlightColor: Colors.transparent,
            onPressed: () {},
            splashColor: Colors.transparent,
            icon: Image.asset(
            'assets/profilepic.png', 
            width: 50,
            height: 50,                                                            
            fit: BoxFit.fill),

          );
}

_cards() {
  List<Widget> _news = [];

  for(var i  = 1 ; i < 8; i++){
    _news.add( Container(
      height: 180,
      width: 250,
      child:Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
            Image.asset(
            'assets/image$i.png', 
            width: 50,
            height: 60,                                                            
            fit: BoxFit.fill)]
      )
        
        )
    )
    );

  }
  return _news;
}

_cards1(){
      List<Map<dynamic, dynamic>> lists = [];
  final dbRef = FirebaseFirestore.instance.collection("news");

   return   StreamBuilder<QuerySnapshot>(
     stream : dbRef.snapshots(),
     builder: (context, snapshot) {
       if(snapshot.hasData){
         return  _buildList(snapshot.data);
       }
       
       return LinearProgressIndicator();
     }
   );



}



Widget _buildList(QuerySnapshot? snapshot) {

  return ListView.builder(
    itemCount: snapshot?.docs.length,
    itemBuilder: (context, index){
      final doc = snapshot?.docs[index];
      return SizedBox(
      height: 180,
      width: 250,
      child:Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      clipBehavior: Clip.antiAlias,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      clipBehavior: Clip.antiAlias,
      child: 
           Image.network(
            doc!["image"], 
            width: 100,
            height: 100,                                                            
            fit: BoxFit.fill)),
           Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      SizedBox(
                       height: 60,
      width: 220,
                        child: Text(doc["title"],  style: TextStyle(fontSize: 10),))   ,
 
                      SizedBox(
                       height: 100,
      width: 220,
                        child: Text(doc["descr"], style: TextStyle(fontSize: 10),) ,)  ,

                      
                    ],) 
                
    
    
          
           ]
      )
        
        )
    );
    });

}