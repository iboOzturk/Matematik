import 'dart:math';
import 'package:flutter/material.dart';

class Daire extends StatefulWidget {
  @override
  _DaireState createState() => _DaireState();
}

class _DaireState extends State<Daire> {
  double r = 0.0, cevre = 0.0, alan = 0.0;
  String cevresnc = " ";
  String alansnc = " ";
  TextEditingController kont1 = TextEditingController(text: "");

  void Hesapla() {
    setState(() {
      r = double.parse(kont1.text);
      cevre = 2*pi*r;
      alan = pi*r*r;
      cevresnc = "Çevre: " + cevre.toString();
      alansnc = "Alan: " + alan.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(flexibleSpace: Container(
        decoration: BoxDecoration(gradient:LinearGradient(colors: [Colors.orange,Colors.lightBlueAccent],begin: Alignment.bottomRight,end: Alignment.topLeft) ),
        ),
        centerTitle: true,
        title: Text('Daire'),
      ),
      body: Container(alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('lib/images/daire.JPG'),
              ),
              TextFormField(
                style: TextStyle(fontSize: 20.0),
                decoration: const InputDecoration(
                  hintText: 'Yarıçapı(r) giriniz: ',
                ),
                keyboardType: TextInputType.number,
                controller: kont1,
              ),
              ElevatedButton(onPressed: Hesapla, child: Text('Hesapla')),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(cevresnc,style: TextStyle(fontSize: 15.0),),
                  Padding(padding: EdgeInsets.only(right: 25.0)),
                  Text(alansnc,style: TextStyle(fontSize: 15.0),),
                ],
              ),
              RaisedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, ('/geometri'));
                },
                icon: Icon(Icons.keyboard_return),
                label: Text('Geridön'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){Navigator.pushNamed(context, '/home');},
        tooltip: 'return',
        child: Icon(Icons.home),
      ),
    );
  }
}
