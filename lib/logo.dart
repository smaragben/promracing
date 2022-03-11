import 'package:flutter/material.dart';


logo(context, _auth) {

  return Container(
    decoration: BoxDecoration(  boxShadow:[BoxShadow(color: Colors.grey, spreadRadius: 5, blurRadius: 7)], borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40) ),
      color: Color.fromARGB(234, 71, 59, 59),

),
  width: MediaQuery.of(context).size.width,
  height: 140.0,
  child:Padding(padding: EdgeInsets.fromLTRB(20.0,60.0, 20.0, 20.0 ), 
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      const SizedBox(width: 10),
      Align(
        alignment: Alignment.centerLeft, 
        child: Row(children: [
          Image.asset(
            'assets/prom.png', 
            width: 135,
            height: 30,                                                            
            fit: BoxFit.fill),
               
            
        ],
        ) 
        ,) ,
     const Spacer(),
      Align(
        alignment: Alignment.centerRight, 
        child: Row(children: [
          const Text('Profile', style: TextStyle(color: Colors.white),),
          const SizedBox(width: 10),
          profilepic(context)
                
        ],) 
      ),
  
      const SizedBox(width: 10),


    ],)
  ),
  );
}



profilepic(context){

    
      return IconButton(
            iconSize: 50,
            padding: const EdgeInsets.all(0),
            highlightColor: Colors.transparent,
            onPressed: (){ Navigator.pushNamed(context, '/Profile');},
            splashColor: Colors.transparent,
            icon: Image.asset(
            'assets/profilepic.png', 
            width: 50,
            height: 50,                                                            
            fit: BoxFit.fill),

          );
}