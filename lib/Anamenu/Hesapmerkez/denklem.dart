import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Denklem extends StatefulWidget {
  @override
  _DenklemState createState() => _DenklemState();
}

class _DenklemState extends State<Denklem> {
  double a = 0.0;
  double b = 0.0;
  double c = 0.0;
  double d = 0.0;
  double x1 = 0.0;
  double x2 = 0.0;
  String kok1 = "Kökler";
  String kok2 = " ";
  TextEditingController kontrolS1 = TextEditingController(text: "");
  TextEditingController kontrolS2 = TextEditingController(text: "");
  TextEditingController kontrolS3 = TextEditingController(text: "");

  void kokleriBul() {
    setState(() {
      a = double.parse(kontrolS1.text);
      b = double.parse(kontrolS2.text);
      c = double.parse(kontrolS3.text);
      d = pow(b, 2) - (4 * a * c);
      if (d > 0) {
        x1 = (-b + sqrt(d)) / (2 * a);
        x2 = (-b - sqrt(d)) / (2 * a);
        kok1 = "Birinci kok: " + x1.toString();
        kok2 = "İkinci kok: " + x2.toString();
      } else if (d == 0) {
        x1 = (-b + sqrt(d)) / (2 * a);
        kok1 = "Çift kat kök: " + x1.toString();
        kok2 = "";
      } else {
        kok1 = "Reel kök yok.";
        kok2="";
      }
    });
  }

  void temizle() {
    setState(() {
      a = 0.0;
      b = 0.0;
      c = 0.0;
      kontrolS2.text = "";
      kontrolS1.text = "";
      kontrolS3.text = "";
      kok1="Kökler";kok2="";
    });
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Scaffold(
        appBar: AppBar(
          ///appbar'da geri butonu
          leading: IconButton(
            onPressed: (){Navigator.pushNamed(context, ('/hesap'));},
            icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
          ),
          centerTitle: true,
          backgroundColor: Colors.tealAccent,
          title: Text(
            'Denklem İşlemleri',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          ///Arkaplan dekarasyonu
          decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.cyanAccent,Colors.red[700]],
              begin: Alignment.bottomRight,end: Alignment.topLeft)
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ///ikinci dereceden denklem olduğunu gösteren text
                Text(
                  'ax^2+bx+c',
                  style: TextStyle(fontSize: 25.0, color: Colors.tealAccent),
                ),
                Padding(padding: EdgeInsets.only(top: 25)),
                ///giriş textformfield'ları
                Row(
                  children:<Widget> [
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Expanded(flex: 1,child: Container(
                      child: TextFormField(
                        style: TextStyle(fontSize: 17.5,color: Colors.white),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                          prefixText: 'a: ',prefixStyle: TextStyle(fontSize: 17,color: Colors.white),
                          hintStyle: TextStyle(color: Colors.white,fontSize: 12),
                          hintText: 'A\'yı giriniz:',
                        ),
                        keyboardType: TextInputType.number,
                        controller: kontrolS1,
                      ),
                    )),
                    Padding(padding: EdgeInsets.only(left: 5)),
                    Expanded(flex: 1,child: Container(
                      child: TextFormField(
                        style: TextStyle(fontSize: 17,color: Colors.white),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                          prefixText: 'b: ',prefixStyle: TextStyle(fontSize: 17,color: Colors.white),
                          hintStyle: TextStyle(color: Colors.white,fontSize: 12),
                          hintText: 'B\'yi giriniz:',
                        ),
                        keyboardType: TextInputType.number,
                        controller: kontrolS2,
                      ),
                    )),
                    Padding(padding: EdgeInsets.only(left: 5)),
                    Expanded(flex: 1,child: Container(
                      child: TextFormField(
                        style: TextStyle(fontSize: 17.5,color: Colors.white),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                          prefixText: 'c: ',prefixStyle: TextStyle(fontSize: 17,color: Colors.white),
                          hintStyle: TextStyle(color: Colors.white,fontSize: 12),
                          hintText: 'C\'yi giriniz:',
                        ),
                        keyboardType: TextInputType.number,
                        controller: kontrolS3,
                      ),
                    )),
                    Padding(padding: EdgeInsets.only(right: 10)),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                ///temizle ve bul butonu
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    ElevatedButton(
                      onPressed: kokleriBul,
                      child: Text('Bul', style: TextStyle(color: Colors.black, fontSize: 20.0),),
                      style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
                          primary: Colors.tealAccent,
                          side: BorderSide(color: Colors.black,width: 2),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
                    ),
                    Padding(padding: EdgeInsets.only(right: 20)),
                    ElevatedButton(onPressed: temizle, child: Text('Temizle',style: TextStyle(fontSize: 20,color: Colors.white),),
                      style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        primary: Colors.red[700],
                        side: BorderSide(color: Colors.black,width: 2),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 25)),
                ///Sonuç texleri
                Text(
                  kok1,
                  style: TextStyle(fontSize: 26.0,color: Colors.white),
                ),
                Text(
                  kok2,
                  style: TextStyle(fontSize: 26.0,color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        ///anamenüye dönme butonu
        floatingActionButton: FloatingActionButton(backgroundColor: Colors.red[700],
          onPressed: (){Navigator.pushNamed(context, '/home');},
          tooltip: 'return',
          child: Icon(Icons.home,color: Colors.tealAccent,),
        ),
      ),
    );
  }
}
