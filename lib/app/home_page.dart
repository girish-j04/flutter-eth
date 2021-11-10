import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tempapp/services/auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key, @required this.auth}) : super(key: key);

  final AuthBase auth;

  Future<void> _signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Home',
        ),
        actions: <Widget>[
          FlatButton(
            child: Image.asset('images/logout-icon.png'),
            onPressed: _signOut,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(26),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 90,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10,),
                    Center(child: Text('Yash',style: TextStyle(fontSize: 22),)),
                    Text('Balance:- 500',style: TextStyle(fontSize: 18),),
                    Text('Associated Bank:- HDFC',style: TextStyle(fontSize: 18),),
                  ],
                ),
              ),
            ),
            Container(
              child: Text('Make Payment', textAlign: TextAlign.center,style: TextStyle(fontSize: 25),),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12))
              ),
              height: 30,
            ),
            SizedBox(height: 16),
            SizedBox(height: 16),
            SizedBox(height: 20,),
            Text(
              'Transaction History',
              style: TextStyle(
                fontSize: 28,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20,),
            SizedBox(
              height: 80,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12))
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget> [
                      Icon(
                        Icons.call_received_rounded,
                        color: Colors.green,
                        size: 35,
                      ),
                      Text('Girish', style: TextStyle(fontSize: 25),),
                      Text('200',style: TextStyle(fontSize: 25),)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 8,),
            SizedBox(
              height: 80,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12))
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget> [
                      Icon(
                        Icons.call_made_rounded,
                        color: Colors.red,
                        size: 35,
                      ),
                      Text('Olan', style: TextStyle(fontSize: 25),),
                      Text('50',style: TextStyle(fontSize: 25),)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 8,),
            SizedBox(
              height: 80,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12))
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget> [
                      Icon(
                        Icons.call_received_rounded,
                        color: Colors.green,
                        size: 35,
                      ),
                      Text('Olan', style: TextStyle(fontSize: 25),),
                      Text('100',style: TextStyle(fontSize: 25),)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 8,),
            SizedBox(
              height: 80,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12))
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget> [
                      Icon(
                        Icons.call_received_rounded,
                        color: Colors.green,
                        size: 35,
                      ),
                      Text('Girish', style: TextStyle(fontSize: 25),),
                      Text('20',style: TextStyle(fontSize: 25),)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 8,),
            SizedBox(
              height: 80,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12))
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget> [
                      Icon(
                        Icons.call_made_rounded,
                        color: Colors.red,
                        size: 35,
                      ),
                      Text('Girish', style: TextStyle(fontSize: 25),),
                      Text('100',style: TextStyle(fontSize: 25),)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
