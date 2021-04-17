import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HesapPage extends StatefulWidget {
  @override
  _HesapPageState createState() => _HesapPageState();
}

class _HesapPageState extends State<HesapPage> {
  ///buton stil fonksiyonu
  final ButtonStyle bStil = ElevatedButton.styleFrom(
    minimumSize: Size(200, 50),
    shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.orange)),
    primary: Colors.black,
    onPrimary: Colors.orange,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
        appBar: AppBar(
          ///appbar dekarasyonu
          leading: Icon(Icons.calculate,color: Colors.black,),
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.only(
              bottomLeft:Radius.circular(20) ,bottomRight:Radius.circular(20) )),
          centerTitle: true,
          backgroundColor: Colors.orange,
          title: Text('HesapMerkezi', style: TextStyle(color: Colors.black),),
        ),
        body: Container(
          ///arkaplan dekarasyonu
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.black, Colors.grey],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ///Basit işlemler butonu
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: ElevatedButton(
                  style: bStil,
                  child: Text(
                    'Basit İşlemler',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onPressed: () {
                        Navigator.pushNamed(context, '/basit');
                  },
                ),
              ),
              ///Denklem işlemleri butonu
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: ElevatedButton(
                  style: bStil,
                  child: Text(
                    'Denklem İşlemleri',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, ('/denklem'));
                  },
                ),
              ),
              ///Geometrik işlemler butonu
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: ElevatedButton(
                  style: bStil,
                  child: Text(
                    'Geometrik İşlemler',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onPressed: () {
                      Navigator.pushNamed(context, '/geometri');
                  },
                ),
              ),
            ],
          ),
        ),
        ///Anamenüye dönme butonu
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          backgroundColor: Colors.orange,
          foregroundColor: Colors.black,
          tooltip: 'return',
          child: Icon(Icons.home),
        ),floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
