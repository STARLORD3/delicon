import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class custbub extends StatefulWidget {
  @override
  custbub(this.Id, this.Name, this.phNumber, this.date);
  String Id, Name, phNumber, date;
  _custbubState createState() => _custbubState(Id, Name, phNumber, date);
}

class _custbubState extends State<custbub> {
  _custbubState(this.Id, this.Name, this.phNumber, this.date);

  String Id, Name, phNumber, date;

  DateTime edate;

  String x;

  bool edit = false;

  void Customer() async {
    final currentUser = await FirebaseAuth.instance.currentUser;
    Firestore.instance.collection('customer').doc(Id).set({
      "ID": Id,
      'Name': Name,
      'PhoneNumber': phNumber,
      'Date': date,
      'userId': currentUser.uid,
      'createdAt': Timestamp.now(),
    });
  }

  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.only(right: 5, left: 5, top: 9, bottom: 6),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(
          color: Color(0xffcac9cc),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(0),
        child: Theme(
          data: Theme.of(context).copyWith(
            accentColor: Colors.grey[600],
          ),
          child: ExpansionTile(
            tilePadding:
                EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
            backgroundColor: Colors.white,

            // leading: Icon(
            //   Icons.brightness_1,
            //   color: Color(0xff52E8E6),
            //   size: 10,
            // ),
            title: Row(
              children: <Widget>[
                Icon(
                  Icons.brightness_1,
                  color: Color(0xbf52E8E6),
                  size: 10,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Customer ID : #$Id',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'medium',
                    color: Color(0xff000000),
                  ),
                ),
                Spacer(),
                FlatButton(
                  onPressed: () {
                    Firestore.instance
                        .collection('customer')
                        .doc(Id)
                        .delete()
                        .whenComplete(() {
                      setState(() {});
                    });
                  },
                  child: Text(
                    "Delete",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'edium',
                      color: Color(0xffffffff),
                    ),
                  ),
                  color: Color(0xff52E8E6),
                )
              ],
            ),
            expandedAlignment: Alignment.topLeft,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Wrap(
                      children: <Widget>[
                        Text(
                          'Name: ',
                          style: TextStyle(
                            fontFamily: 'medium',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        if (!edit)
                          Text(
                            '$Name',
                            style: TextStyle(
                              fontFamily: 'medium',
                              fontSize: 18,
                              color: Color(0xff52E8E6),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        if (edit)
                          TextFormField(
                            initialValue: Name,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              letterSpacing: 1.1,
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter a valid username';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
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
                          )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 5),
                      child: Wrap(
                        children: <Widget>[
                          Text(
                            'Phone Number: ',
                            style: TextStyle(
                              fontFamily: 'medium',
                              fontSize: 18,
                            ),
                          ),
                          if (!edit)
                            Text(
                              '+91$phNumber',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'medium',
                                  color: Color(0xff000000)),
                            ),
                          if (edit)
                            TextFormField(
                              initialValue: phNumber,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                letterSpacing: 1.1,
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter a valid username';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
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
                                phNumber = newValue;
                              },
                            )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 5),
                      child: Wrap(
                        children: <Widget>[
                          Text(
                            'Date: ',
                            style: TextStyle(
                              fontFamily: 'medium',
                              fontSize: 18,
                            ),
                          ),
                          if (!edit)
                            Text(
                              '$date',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'medium',
                                  color: Color(0xff000000)),
                            ),
                          if (edit)
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(60))),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    date,
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
                                          edate = value;
                                          setState(() {
                                            date =
                                                '${edate.year.toString()}-${edate.month.toString().padLeft(2, '0')}-${edate.day.toString().padLeft(2, '0')}';
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
                      margin: EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          if (!edit)
                            RaisedButton(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'EDIT',
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Color(0xffCCA7EC),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              onPressed: () {
                                setState(() {
                                  edit = !edit;
                                });
                                print(edit);
                              },
                            ),
                          if (edit)
                            RaisedButton(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'CANCEL',
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Color(0xffCCA7EC),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              onPressed: () {
                                setState(() {
                                  edit = !edit;
                                });
                                print(edit);
                              },
                            ),
                          if (edit)
                            RaisedButton(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'SAVE',
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Color(0xffCCA7EC),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              onPressed: () {
                                Customer();
                                setState(() {
                                  edit = !edit;
                                });
                                print(edit);
                              },
                            ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
