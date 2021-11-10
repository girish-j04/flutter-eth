import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tempapp/services/auth.dart';

import 'email_sign_in_form.dart';

const col = const Color(0xfffff0d9);

class EmailSignInPage extends StatelessWidget {
  const EmailSignInPage({Key key, @required this.auth}) : super(key: key);

  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        shadowColor: Colors.transparent,
        title: Text(
          'Login',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Card(
            child: EmailSignInForm(
              auth: auth,
            ),
            color: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
