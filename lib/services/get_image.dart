import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class GetImage extends StatelessWidget {
  final String documentID;

  GetImage(this.documentID);

  @override
  Widget build(BuildContext context) {
    CollectionReference teachers =
        FirebaseFirestore.instance.collection('teachers');

    return FutureBuilder<DocumentSnapshot>(
      future: teachers.doc(documentID).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Something went wrong'));
        }

        if (snapshot.hasData && !snapshot.data.exists) {
          return Text('Document does not exist');
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Image.network(
            "${data['image_url']}",
            fit: BoxFit.cover,
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
