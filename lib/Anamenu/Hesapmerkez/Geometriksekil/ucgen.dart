import 'dart:math';
import 'package:flutter/material.dart';

class Ucgen extends StatefulWidget {
  @override
  _UcgenState createState() => _UcgenState();
}

class _UcgenState extends State<Ucgen> {
  double b = 0.0, c = 0.0, h = 0.0, cevre = 0.0, alan = 0.0;
  String cevresnc = " ";
  String alansnc = " ";
  TextEditingController kont1 = TextEditingController(text: "");
  TextEditingController kont2 = TextEditingController(text: "");

  void Hesapla() {
    setState(() {
      b = double.parse(kont1.text);
      c = double.parse(kont2.text);
      h = sqrt(b * b + c * c);
      cevre = b + c + h;
      alan = (b * c) / 2;
      cevresnc = "Çevre: " + cevre.toString();
      alansnc = "Alan: " + alan.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('DikÜçgen'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image(
                  image: AssetImage('lib/images/ucgen.JPG'),
              ),
              TextFormField(
                style: TextStyle(fontSize: 20.0),
                decoration: const InputDecoration(
                  hintText: 'b yi giriniz: ',
                ),
                keyboardType: TextInputType.number,
                controller: kont1,
              ),
              TextFormField(
                style: TextStyle(fontSize: 20.0),
                decoration: const InputDecoration(
                  hintText: 'c yi giriniz: ',
                ),
                keyboardType: TextInputType.number,
                controller: kont2,
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
