import 'package:flutter/material.dart';
import 'package:promracing/services/auth.dart';
import 'package:promracing/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PromMembers extends StatefulWidget {
  const PromMembers({Key? key}) : super(key: key);
  static const String routeName = "/PromMembers";
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _PromMembersState();
}

class _PromMembersState extends State<PromMembers> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: wrapper(context, members(), _auth, 2),
        ));
  }
}

members() {
  List<CollectionReference> list = [];
  var dbRef = FirebaseFirestore.instance.collection("promMembers");
  list.add(dbRef);
<<<<<<< HEAD
  dbRef = FirebaseFirestore.instance.collection("promMembersAerodynamics");
  list.add(dbRef);
  dbRef = FirebaseFirestore.instance.collection("promMembersElectronics");
  list.add(dbRef);
=======
  dbRef = FirebaseFirestore.instance.collection("promMembersElectronics");
  list.add(dbRef);
  dbRef = FirebaseFirestore.instance.collection("promMembersAerodynamics");
  list.add(dbRef);
>>>>>>> e38c2c85c3d325e97c7e32b47b8f7126700ac06b
  dbRef = FirebaseFirestore.instance.collection("promMembersLogistics");
  list.add(dbRef);
  dbRef = FirebaseFirestore.instance
      .collection("promMembersMarketingAndBusinessPlan");
  list.add(dbRef);
  dbRef = FirebaseFirestore.instance
      .collection("promMembersMechanicalDesignAndManufacturing");
  list.add(dbRef);
  dbRef = FirebaseFirestore.instance.collection("promMembersVehicleDynamics");
  list.add(dbRef);
<<<<<<< HEAD

  for (var i = 0; i < list.length; i++) {
    return StreamBuilder<QuerySnapshot>(
        stream: dbRef.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildImage(snapshot.data);
          }

=======
  for (var i = 0; i < list.length; i++) {
    return StreamBuilder<QuerySnapshot>(
        stream: dbRef.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildImage(snapshot.data);
          }

>>>>>>> e38c2c85c3d325e97c7e32b47b8f7126700ac06b
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
                          image: NetworkImage(doc!["photo"]),
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
                    color: Colors.yellow,
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
                    color: Colors.orange,
                  ),
                  child: Text(doc["job"]),
                ),
              )
            ],
          ),
        );
      });
}
