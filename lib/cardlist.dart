
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:promracing/newsdetails.dart';


cards1(){
      List<Map<dynamic, dynamic>> lists = [];
  final dbRef = FirebaseFirestore.instance.collection("news");

   return   StreamBuilder<QuerySnapshot>(
     stream : dbRef.snapshots(),
     builder: (context, snapshot) {
       if(snapshot.hasData){
         return  _buildList(snapshot.data);
       }
       
       return const LinearProgressIndicator();
     }
   );



}




Widget _buildList(QuerySnapshot? snapshot) {
  return ListView.builder(
    
    itemCount: snapshot?.docs.length ?? 0,
    itemBuilder: (context, index){
      final doc = snapshot?.docs[index];
      final month = doc!["date"].toDate().month.toString();
      final day = doc["date"].toDate().day.toString();
      final year = doc["date"].toDate().year.toString();

      return SizedBox(
        
      height: 280,
      width: 250,
      child: Stack(
                      children: <Widget>[
  
                        Positioned(
                          left: 30,
                          top: 30,
                          child: Container(
                            height: 200,
                            width: 290,
                            child: Material(
                              type: MaterialType.transparency,
                              child: InkWell(
                              child: Ink.image(
                                image: NetworkImage( doc["image"]),
                                 padding: const EdgeInsets.all(0.0),
                                ),
                            
                             onTap: () {

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => NewsDetails(snapshot: snapshot?.docs[index])),
                              );
                            },
                            ) ,)
                          ),
                        ), 
                        Positioned(
                          top: 20,
                          left: 20,
                          child: Container(
                            alignment: Alignment.center,
                            width: 150,
                            height: 25,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(const Radius.circular(20)),
                              color: Colors.red,

                             ),
                            child:Text(day+"-"+month+"-"+year,  style: const TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.w700,), )), 
                          ),
                           Positioned(
                          top: 205,
                          left: 10,
                          child: Container(
                            
                            alignment: Alignment.center,
                            width: 330,
                            height: 60,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(234, 71, 59, 59),
                                     borderRadius: BorderRadius.all(const Radius.circular(20)),
                             ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                               child: Center( 
                              child:Text(doc["descr"], textAlign: TextAlign.center, style: const TextStyle(fontSize: 9, color: Colors.white),)), ),
                         )
                       
                             ),
                      ], 
                    ),
                    
                    
                    );
    }
  );
    }
