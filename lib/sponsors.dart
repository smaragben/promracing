import 'package:flutter/material.dart';
import 'package:promracing/services/auth.dart';
import 'package:promracing/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Sponsors extends StatefulWidget {
  const Sponsors({Key? key}) : super(key: key);
<<<<<<< HEAD
  static const String routeName = "/Sponsors";
=======
  static const String routeName = "/PromMembers";
>>>>>>> e38c2c85c3d325e97c7e32b47b8f7126700ac06b
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _SponsorsState();
}

class _SponsorsState extends State<Sponsors> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
<<<<<<< HEAD
          children: wrapper(context, sponsors(), _auth, 6),
=======
          children: wrapper(context, members(), _auth, 2),
>>>>>>> e38c2c85c3d325e97c7e32b47b8f7126700ac06b
        ));
  }
}

<<<<<<< HEAD
sponsors() {
  List<CollectionReference> list = [];
  var dbRef = FirebaseFirestore.instance.collection("bronzeSponsors");
=======
members() {
  List<CollectionReference> list = [];
  var dbRef = FirebaseFirestore.instance.collection("supporters");
  list.add(dbRef);
  dbRef = FirebaseFirestore.instance.collection("mediaSponsorship");
  list.add(dbRef);
  dbRef = FirebaseFirestore.instance.collection("bronzeSponsors");
>>>>>>> e38c2c85c3d325e97c7e32b47b8f7126700ac06b
  list.add(dbRef);
  dbRef = FirebaseFirestore.instance.collection("silverSponsors");
  list.add(dbRef);
  dbRef = FirebaseFirestore.instance.collection("goldenSponsors");
  list.add(dbRef);
  dbRef = FirebaseFirestore.instance.collection("platinumSponsors");
  list.add(dbRef);
<<<<<<< HEAD
  dbRef = FirebaseFirestore.instance.collection("supporters");
  list.add(dbRef);
  dbRef = FirebaseFirestore.instance.collection("mediaSponsorship");
  list.add(dbRef);

  for (var i = 0; i < list.length; i++) {
=======

  for (int i = 0; i < list.length; i++) {
>>>>>>> e38c2c85c3d325e97c7e32b47b8f7126700ac06b
    return StreamBuilder<QuerySnapshot>(
        stream: dbRef.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildImage(snapshot.data);
          }

          return const LinearProgressIndicator();
        });
  }
}

Widget _buildImage(QuerySnapshot? snapshot) {
  return ListView.builder(
      itemCount: snapshot?.docs.length ?? 0,
      itemBuilder: (context, index) {
        final doc = snapshot?.docs[index];
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
<<<<<<< HEAD
                          image: NetworkImage(doc!["logo"]),
=======
                          image: NetworkImage(doc!["photo"]),
>>>>>>> e38c2c85c3d325e97c7e32b47b8f7126700ac06b
                          padding: const EdgeInsets.all(0.0),
                        ),
                        onTap: () {},
                      ),
                    )),
              ),
              Positioned(
                top: 20,
                left: 20,
                child: Container(
                  alignment: Alignment.center,
                  width: 150,
                  height: 25,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.blue,
                  ),
                  child: Text(doc["name"]),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  alignment: Alignment.center,
                  width: 150,
                  height: 25,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.purple,
                  ),
                  child: Text(doc["type"]),
                ),
              )
            ],
          ),
        );
      });
}
