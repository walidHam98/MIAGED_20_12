import 'package:flutter/material.dart';
import 'package:vinted_like/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vinted_like/firebase/firebaseConfig.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ProductInformation extends StatefulWidget {
  @override
  _ProductInformationState createState() => _ProductInformationState();
}

class _ProductInformationState extends State<ProductInformation> {
  final Stream<QuerySnapshot> _productStream =
  FirebaseFirestore.instance.collection('vêtements').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _productStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return ListTile(
                title: Text(data['titre']),
                subtitle: Text(data['size']),
                leading: Image.network(data['image']),
                trailing: Text(data['prix'] + "dhs")
            );
          }).toList(),
        );
      },
    );
  }
}


Stream collectionStream = FirebaseFirestore.instance.collection('users').snapshots();