import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Basit extends StatefulWidget {
  @override
  _BasitState createState() => _BasitState();
}

class _BasitState extends State<Basit> {
  double s1 = 0.0, s2 = 0.0, sonuc = 0.0;
  TextEditingController kontrolS1 = TextEditingController(text: "");
  TextEditingController kontrolS2 = TextEditingController(text: "");

  void toplama() {
    setState(() {
      s1 = double.parse(kontrolS1.text);
      s2 = double.parse(kontrolS2.text);
      sonuc = s1 + s2;
    });
  }

  void cikarma() {
    setState(() {
      s1 = double.parse(kontrolS1.text);
      s2 = double.parse(kontrolS2.text);
      sonuc = s1 - s2;
    });
  }

  void bolme() {
    setState(() {
      s1 = double.parse(kontrolS1.text);
      s2 = double.parse(kontrolS2.text);
      sonuc = s1 / s2;
    });
  }

  void carpma() {
    setState(() {
      s1 = double.parse(kontrolS1.text);
      s2 = double.parse(kontrolS2.text);
      sonuc = s1 * s2;
    });
  }

  void temizle() {
    setState(() {
      s1 = 0.0;
      s2 = 0.0;
      kontrolS2.text = "";
      kontrolS1.text = "";
      sonuc = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, ('/hesap'));
            },
            icon: Icon(Icons.arrow_back_ios,color: Colors.orange)),
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          'Basit İşlemler',
          style: TextStyle(color: Colors.orange),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    color: Colors.orange,
                    onPressed: toplama,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 35),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 3),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    child: Text(
                      '+',
                      style: TextStyle(fontSize: 40, color: Colors.black),
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    width: 25,
                    height: 57,
                  ),
                  FlatButton(
                    color: Colors.orange,
                    onPressed: cikarma,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 35),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 3),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Text(
                      '-',
                      style: TextStyle(fontSize: 40, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              Padding(
                padding: const EdgeInsets.only(left: 100, right: 100),
                child: TextFormField(
                  style: TextStyle(fontSize: 20.0),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    hintText: '1. sayiyi giriniz:',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: kontrolS1,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              Padding(
                padding: const EdgeInsets.only(left: 100, right: 100),
                child: TextFormField(
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    hintText: '2. sayiyi giriniz:',
                  ),
                  controller: kontrolS2,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                      color: Colors.orange,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 35),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 3),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              topLeft: Radius.circular(20))),
                      onPressed: bolme,
                      child: Text(
                        '/',
                        style: TextStyle(fontSize: 40.0, color: Colors.black),
                      )),
                  Container(
                    color: Colors.black,
                    width: 25,
                    height: 57,
                  ),
                  // Padding(padding: EdgeInsets.only(right: 20),),
                  FlatButton(
                      color: Colors.orange,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 35),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 3),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      onPressed: carpma,
                      child: Text(
                        'X',
                        style: TextStyle(fontSize: 40.0, color: Colors.black),
                      )),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 8)),
              Text(
                'Sonuc: $sonuc',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.black,
                ),
              ),
              FlatButton.icon(
                icon: Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
                onPressed: temizle,
                label: Text(
                  'Temizle',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          Navigator.pushNamed(context, '/home');
        },
        tooltip: 'return',
        child: Icon(
          Icons.home,
          color: Colors.black,
        ),
      ),
    );
  }
}
