import 'dart:math';

import 'package:flutter/material.dart';
import 'package:delicon/widget/auth.dart';

class authscreen extends StatefulWidget {
  @override
  _authscreenState createState() => _authscreenState();
}

class _authscreenState extends State<authscreen> {
  final _formKEy = GlobalKey<FormState>();

  bool _islogin = true;

  var _email = '';
  var _password = '';
  var _username = '';

  void _trySubmit() {
    var isValid = _formKEy.currentState.validate();

    if (isValid) {
      _formKEy.currentState.save();
      auth(_email, _password, _username, _islogin, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: <Widget>[
            Expanded(
                child: Container(
              alignment: Alignment.bottomCenter,
              child: Image(
                image: AssetImage('assets/logo.png'),
                fit: BoxFit.contain,
              ),
            )),
            Container(
              alignment: Alignment.bottomCenter,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 10.0,
                margin: EdgeInsets.all(0),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Form(
                        key: _formKEy,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Welcome,",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  _islogin ? "SignIn" : "SignUp",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Doodhiya",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value.isEmpty || !value.contains('@')) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'Email ',
                              ),
                              onSaved: (newValue) {
                                _email = newValue;
                              },
                            ),
                            if (!_islogin)
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Username',
                                  hoverColor: Theme.of(context).primaryColor,
                                  fillColor: Theme.of(context).primaryColor,
                                  focusColor: Theme.of(context).primaryColor,
                                ),
                                validator: (value) {
                                  if (value.isEmpty || value.length < 4) {
                                    return 'Please enter atleast 4 character';
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  _username = newValue;
                                },
                              ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Password',
                              ),
                              validator: (value) {
                                if (value.isEmpty || value.length < 7) {
                                  return 'Please enter atleast 7 character long password';
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                _password = newValue;
                              },
                              obscureText: true,
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            RaisedButton(
                              highlightElevation: 10.0,
                              padding:
                                  EdgeInsets.fromLTRB(25.0, 12.5, 25.0, 12.5),
                              child: Text(
                                _islogin ? 'Login' : 'Signup',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                _trySubmit();
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            FlatButton(
                              onPressed: () {
                                setState(() {
                                  _islogin = !_islogin;
                                });
                              },
                              child: Text(_islogin
                                  ? "Create new account"
                                  : "I already have account?"),
                              textColor: Theme.of(context).primaryColor,
                            )
                          ],
                        )),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
