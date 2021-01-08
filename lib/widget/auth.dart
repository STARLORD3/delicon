import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class auth extends StatelessWidget {
  auth(this._email, this._password, this._username, this._isLogin, this.ctx) {
    _submitAuthForm(_email, _password, _username, _isLogin, ctx);
  }

  final String _email;
  final String _password;
  final String _username;
  final bool _isLogin;
  BuildContext ctx;

  void _submitAuthForm(String email, String password, String username,
      bool isLogin, BuildContext ctx) async {
    UserCredential userCredential;
    try {
      if (isLogin) {
        userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
      } else {
        userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user.uid)
            .set({
          'username': username,
          'email': email,
        });
      }
    } on PlatformException catch (err) {
      var message = "please check your credential";
      if (err.message != null) {
        message = err.message;
        err;
      }
      print(message);
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}
