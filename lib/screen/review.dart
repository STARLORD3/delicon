import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:delicon/widget/review_bub.dart';

class review extends StatefulWidget {
  @override
  _review createState() => _review();
}

class _review extends State<review> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.1,
              top: MediaQuery.of(context).size.height * 0.04,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0, top: 16, bottom: 16),
            child: Row(
              children: <Widget>[],
            ),
          ),
          Expanded(
            child: ConstrainedBox(
              constraints: BoxConstraints(),
              child: StreamBuilder(
                  stream: Firestore.instance
                      .collection('customer')
                      .orderBy('createdAt', descending: true)
                      .snapshots(),
                  builder: (context, chatSnapshot) {
                    if (chatSnapshot.data == Null)
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    if (chatSnapshot.connectionState == ConnectionState.waiting)
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    final User sam = FirebaseAuth.instance.currentUser;
                    return ListView.builder(
                        reverse: false,
                        shrinkWrap: true,
                        itemCount: chatSnapshot.data.documents.length,
                        itemBuilder: (context, index) => custbub(
                              chatSnapshot.data.documents[index].get('ID'),
                              chatSnapshot.data.documents[index].get('Name'),
                              chatSnapshot.data.documents[index]
                                  .get('PhoneNumber'),
                              chatSnapshot.data.documents[index].get('Date'),
                            ));
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
