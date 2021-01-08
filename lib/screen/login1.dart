import 'package:clip_shadow/clip_shadow.dart';
import 'package:flutter/material.dart';
import 'package:delicon/screen/addcus.dart';
import 'package:delicon/widget/auth.dart';

class login1 extends StatefulWidget {
  @override
  _login1State createState() => _login1State();
}

class _login1State extends State<login1> {
  @override
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

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F5F7),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: ClipPath(
                      clipper: oclip(),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          color: Color(0xff0a2a6e),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: ClipShadow(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(-10.0, -200.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                          color: Color(0x4f0084ff),
                        )
                      ],
                      clipper: rclip(),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          color: Color(0xff0084ff),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.1,
                        top: MediaQuery.of(context).size.height * 0.1,
                      ),
                      child: Text(
                        _islogin ? 'Login' : 'Signup',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xffF4F5F7),
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
                top: MediaQuery.of(context).size.height * 0.1,
              ),
              child: Form(
                key: _formKEy,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20, bottom: 10),
                      child: Text(
                        'Email',
                        style: TextStyle(
                          color: Color(0xff5c6170),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
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
                      onSaved: (newValue) {
                        _email = newValue;
                      },
                    )),
                    if (!_islogin)
                      Container(
                        margin: EdgeInsets.only(left: 20, bottom: 10),
                        child: Text(
                          'Username',
                          style: TextStyle(
                            color: Color(0xff5c6170),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    if (!_islogin)
                      Container(
                          child: TextFormField(
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
                        onSaved: (newValue) {
                          _username = newValue;
                        },
                      )),
                    Container(
                      margin: EdgeInsets.only(left: 20, bottom: 10),
                      child: Text(
                        'Password',
                        style: TextStyle(
                          color: Color(0xff5c6170),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                        child: TextFormField(
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        letterSpacing: 1.1,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a valid password';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
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
                      onSaved: (newValue) {
                        _password = newValue;
                      },
                    )),
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
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 100),
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'LOGIN',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Color(0xff0084ff),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        onPressed: () {
                          _trySubmit();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//clipping of left item
class oclip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var ns = 0.65;
    var nw = 0.65;
    path.lineTo(0, size.height * ns);
    path.lineTo(size.width * nw * 0.65 - 50, size.height * ns);
    path.quadraticBezierTo(size.width * nw * 0.65, size.height * ns,
        size.width * nw * 0.65 + 18, size.height * ns - 50);
    path.lineTo(size.width * nw, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
    throw UnimplementedError();
  }
}

//clipping of left item
class rclip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var ns = 0.65;
    var nw = 0.65;
    path.moveTo(size.width * nw + 60, 0);
    path.lineTo(size.width * nw - 60, size.height - 60);
    path.quadraticBezierTo(
        size.width * nw - 80, size.height, size.width * nw - 10, size.height);
    path.lineTo(size.width - 80, size.height);
    path.quadraticBezierTo(
        size.width - 40, size.height, size.width - 30, size.height - 20);
    path.lineTo(size.width, size.height - 100);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
    throw UnimplementedError();
  }
}
