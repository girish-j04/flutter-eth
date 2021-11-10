import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tempapp/app/landing_page.dart';
import 'package:tempapp/services/auth.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet',
      theme: ThemeData(
        // primarySwatch: Colors.green,
    ),
    home: LandingPage(
      auth: Auth(),
    ),
    );
  }
}

