import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class addcus extends StatefulWidget {
  @override
  _addcusState createState() => _addcusState();
}

class _addcusState extends State<addcus> {
  final _formkey = GlobalKey<FormState>();
  @override
  FocusNode secdig = new FocusNode();
  FocusNode thirdig = new FocusNode();
  FocusNode fordig = new FocusNode();

  var ID;
  var Name;
  var PhNumber;

  DateTime date;
  String x;

  void finalOrder() async {
    final currentUser = await FirebaseAuth.instance.currentUser;
    Firestore.instance.collection('customer').doc(ID).set({
      "ID": ID,
      'Name': Name,
      'PhoneNumber': PhNumber,
      'Date': x,
      'userId': currentUser.uid,
      'createdAt': Timestamp.now(),
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.07,
                  left: 7,
                ),

                // height: MediaQuery.of(context).size.height * 0.1,
                child: Row(
                  children: <Widget>[
                    // IconButton(
                    //   icon: Icon(Icons.arrow_back),
                    //   color: Colors.grey[600],
                    //   iconSize: 28,
                    //   onPressed: () {
                    //     Navigator.pop(context);
                    //   },
                    // ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Adding a customer',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey[600],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02 + 20,
                    left: 60,
                    right: 0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                            left: 20,
                          ),
                          child: Text(
                            'Customer ID',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0,
                        right: MediaQuery.of(context).size.width * 0.05,
                        top: MediaQuery.of(context).size.height * 0.01,
                        bottom: MediaQuery.of(context).size.height * 0.01,
                      ),
                      child: TextFormField(
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          letterSpacing: 1.1,
                        ),
                        validator: (value) {
                          if (value.isEmpty || !value.contains('@')) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          counterText: "",
                          contentPadding: EdgeInsets.all(20),
                          // hintText: 'Number',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          filled: true,

                          fillColor: Colors.grey[300],
                        ),
                        onChanged: (newValue) {
                          ID = newValue;
                        },
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                            left: 20,
                          ),
                          child: Text(
                            'Name',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0,
                        right: MediaQuery.of(context).size.width * 0.05,
                        top: MediaQuery.of(context).size.height * 0.01,
                        bottom: MediaQuery.of(context).size.height * 0.01,
                      ),
                      child: TextFormField(
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          letterSpacing: 1.1,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a valid name';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          counterText: "",
                          contentPadding: EdgeInsets.all(20),
                          // hintText: 'Number',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          filled: true,

                          fillColor: Colors.grey[300],
                        ),
                        onChanged: (newValue) {
                          Name = newValue;
                        },
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                            left: 20,
                          ),
                          child: Text(
                            'Phone Number',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0,
                        right: MediaQuery.of(context).size.width * 0.05,
                        top: MediaQuery.of(context).size.height * 0.01,
                        bottom: MediaQuery.of(context).size.height * 0.01,
                      ),
                      child: TextFormField(
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          letterSpacing: 1.1,
                        ),
                        validator: (value) {
                          if (value.isEmpty || !value.contains('@')) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          counterText: "",
                          contentPadding: EdgeInsets.all(20),
                          // hintText: 'Number',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          filled: true,

                          fillColor: Colors.grey[300],
                        ),
                        onChanged: (newValue) {
                          PhNumber = newValue;
                        },
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                            left: 20,
                          ),
                          child: Text(
                            'Date',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0,
                        right: MediaQuery.of(context).size.width * 0.05,
                        top: MediaQuery.of(context).size.height * 0.01,
                      ),
                      padding: EdgeInsets.only(left: 25),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.all(Radius.circular(60))),
                      child: Row(
                        children: <Widget>[
                          Text(
                            date == null ? 'Please select a date' : '$x',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.grey[500],
                            ),
                          ),
                          Spacer(),
                          FlatButton(
                              onPressed: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2025))
                                    .then((value) {
                                  date = value;
                                  setState(() {
                                    x = '${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
                                  });
                                });
                              },
                              child: Icon(
                                Icons.calendar_today,
                                color: Colors.grey[700],
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: Container(
                  margin: EdgeInsets.only(
                    top: 175,
                    bottom: 15,
                    left: 20,
                    right: 20,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'CONTINUE',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Color(0xffCCA7EC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    onPressed: () {
                      finalOrder();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
