import 'package:flutter/material.dart';
import 'package:promracing/services/auth.dart';
import 'package:promracing/theme.dart';


class PhotosWidget extends StatefulWidget {
  const Photos({Key? key}) : super(key: key);
  static const String routeName = "/Photos";
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _PhotosState();
  
  
}

class _PhotosState extends State<PhotosWidget> {
 final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    return
      Scaffold(
                    backgroundColor: Colors.white,
                    body: Column(
     
                        children: wrapper(context, images1(), _auth),
                        )
                  ) ;
  }
}
images1(){
      List<Map<dynamic, dynamic>> lists = [];
  final dbRef = FirebaseFirestore.instance.collection("photos");

   return   StreamBuilder<QuerySnapshot>(
     stream : dbRef.snapshots(),
     builder: (context, snapshot) {
       if(snapshot.hasData){
         return  _buildImage(snapshot.data);
       }
       
       return const LinearProgressIndicator();
     }
   );
}

Widget _buildImage {
    return ListView.builder(
    
    itemCount: snapshot?.docs.length ?? 0,
    itemBuilder: (context, index){
      final doc = snapshot?.docs[index];
      return SizeBox (
      height: 280,
      width: 250,
      child: Stack (

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
                            child:Text(doc["title"]), 
                          ),
                         )
                       
                             ),
                      ], 
                    ),
                  );
    }
}


