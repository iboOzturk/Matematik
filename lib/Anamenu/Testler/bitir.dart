import 'package:flutter/material.dart';
class Bitir extends StatefulWidget {
  @override
  _BitirState createState() => _BitirState(); }
class _BitirState extends State<Bitir> {
  @override
  Widget build(BuildContext context) {
    var data = [];
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.cyanAccent, Colors.lightGreenAccent],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 3,
                child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget> [
                Text('Matematik Kültürü', style: TextStyle(fontSize: 40.0,decoration: TextDecoration.underline,decorationThickness: 1.5,)),
                Text('Puan: '+data[0].toString(), style: TextStyle(fontSize: 50.0)),
              ],),
            )),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: FloatingActionButton(
                  child: Icon(Icons.home),
                  backgroundColor: Colors.black,
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                ),
                padding: EdgeInsets.only(bottom: 15.0),
              ),
            ),
          ],
        ),
      ),
    ); } }