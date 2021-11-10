

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tempapp/app/home_page.dart';
import 'package:tempapp/app/sign_in/email_sign_in_page.dart';
import 'package:tempapp/app/sign_in/sign_in_page.dart';
import 'package:tempapp/app/wallet.dart';
import 'package:tempapp/services/auth.dart';


class LandingPage extends StatelessWidget {
  const LandingPage({Key key, @required this.auth}) : super(key: key);
  final AuthBase auth;


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.active){
          final User user = snapshot.data;
          if (user == null){
            return WalletPage();
            return SignInPage(auth: auth);
          }
          return HomePage(
            auth: auth,
          );
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );

  }
}
