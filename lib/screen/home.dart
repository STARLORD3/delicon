import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:delicon/screen/review.dart';
import 'package:delicon/screen/addcus.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget showpage = review();
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 70,
        color: Color(0xff52E8E6),
        backgroundColor: Color(0xfff2f2f2),
        items: [
          Icon(
            Icons.add,
            size: 40,
          ),
          Container(
            margin: EdgeInsets.only(),
            child: Icon(
              Icons.home,
              size: 40,
            ),
          ),
          Icon(
            Icons.exit_to_app,
            size: 40,
          ),
        ],
        index: 1,
        animationDuration: Duration(milliseconds: 200),
        animationCurve: Curves.bounceInOut,
        onTap: (val) {
          if (val == 0)
            setState(() {
              showpage = addcus();
            });
          if (val == 1)
            setState(() {
              showpage = review();
            });
          if (val == 2) FirebaseAuth.instance.signOut();
        },
      ),
      body: showpage,
    );
  }
}
