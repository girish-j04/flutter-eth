import 'package:flutter/material.dart';
import 'package:tempapp/app/sign_in/email_sign_in_page.dart';
import 'package:tempapp/app/sign_in/social_sign_in_button.dart';
import 'package:tempapp/services/auth.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key key, @required this.auth}) : super(key: key);
  final AuthBase auth;


  Future<void> _signInAnonymously() async {
    try{
      await auth.signInAnonymously();
    } catch(e){
      print(e.toString());
    }
  }

  Future<void> _signInWithGoogle() async {
    try{
      await auth.signInWithGoogle();
    } catch(e){
      print(e.toString());
    }
  }

  Future<void> _signInWithFacebook() async {
    try{
      await auth.signInWithFacebook();
    } catch(e){
      print(e.toString());
    }
  }

  void _signInWithEmail(BuildContext context){
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(auth: auth,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: Text('Wallet'),
        elevation: 2,
      ),
      body: _buildContent(context),
      backgroundColor: Colors.blueGrey[100],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Sign-In',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 48),
          SocialSignInButton(
            assetName: 'images/google-logo.png',
            text: 'Sign in with Google',
            color: Colors.white,
            textColor: Colors.black87,
            onPressed: _signInWithGoogle,
          ),
          SizedBox(height: 8),
          SocialSignInButton(
            assetName: 'images/facebook-logo.png',
            text: 'Sign in with Facebook',
            color: Color(0xFF334D92),
            textColor: Colors.white,
            onPressed: _signInWithFacebook,
          ),
          SizedBox(height: 8),
          SocialSignInButton(
            assetName: 'images/email-logo.png',
            text: 'Sign in with Email',
            color: Colors.teal[700],
            textColor: Colors.white,
            onPressed: () => _signInWithEmail(context),
          ),
          SizedBox(height: 8),
          Text(
            'or',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8,
          ),
          SocialSignInButton(
            assetName: 'images/anon-logo.png',
            text: 'Guest User',
            color: Colors.redAccent[400],
            textColor: Colors.white,
            onPressed: _signInAnonymously,
          ),
        ],
      ),
    );
  }
}
