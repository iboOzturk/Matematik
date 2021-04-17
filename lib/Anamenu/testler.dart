import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Testler extends StatefulWidget {
  @override
  _TestlerState createState() => _TestlerState();
}

class _TestlerState extends State<Testler> {
  var sorular = [
    {
      'soru': 'Pi sayısını kim bulmuştur?',
      'cevaplar': ['Leonhard Euler', 'Pisagor', 'Ali Kuşcu'],
      'dogrucevap': 'Leonhard Euler'
    },
    {
      'soru': 'e sayısı kaçtır?',
      'cevaplar': ['2.8612', '3.1415', '2.7182'],
      'dogrucevap': '2.7182'
    },
    {
      'soru': 'Aşağıdakilerden hangisi matematikçi değildir?',
      'cevaplar': ['Cahit Arf', 'Yaşar Kemal', 'Kerim Erim'],
      'dogrucevap': 'Yaşar Kemal'
    },
    {
      'soru':
          'Eski yunan\'da akademi kapısına \'Geometri bilmeyen giremez\' yazısını asmıştır  ?',
      'cevaplar': ['Pisagor', 'Öklid', 'Platon'],
      'dogrucevap': 'Platon'
    },
    {
      'soru':
          'Matematik yunanca matetis kelimesinden gelir. Matetis ne demektir?',
      'cevaplar': ['Ben bilirim', 'Sayı bilgisi', 'Sayma gücü'],
      'dogrucevap': 'Ben bilirim'
    },
    {
      'soru': 'Kullandığımız kaç tane rakam vardır?',
      'cevaplar': ['9', '10', '11'],
      'dogrucevap': '10'
    },
    {
      'soru': '2-2*3+8/(1+3)?',
      'cevaplar': ['-8', '2', '-2'],
      'dogrucevap': '-2'
    },
    {
      'soru': '0 rakamını hangi ünlü islam alimi bulmuştur?',
      'cevaplar': ['Ali Kuşcu', 'Farabi', 'Harezmi'],
      'dogrucevap': 'Harezmi'
    },
    {
      'soru': 'Cebirin kurucusu kimdir?',
      'cevaplar': ['Harezmi', 'Ömer Hayyam', 'Cezeri'],
      'dogrucevap': 'Harezmi'
    },
    {
      'soru': 'Hangisi Roma rakamlarını temsil eden bir harf değildir?',
      'cevaplar': ['L', 'M', 'P'],
      'dogrucevap': 'P'
    },
  ];
  int mevcutSoru = 0;
  int puan = 0;
  String mevcutcevap = '';

  void BitireYolla() {
    var data = [];
    data.add(puan.toString());
    Navigator.pushNamed(context, ('/bitir'),arguments: data);
    //Navigator.push(context, MaterialPageRoute(builder: (context) => Bitir(), settings: RouteSettings(arguments: data,),));
  }
  String cevabaGoreMetin="";
  void kontrolEt() {
    if (mevcutcevap == sorular[mevcutSoru]['dogrucevap']) {
      puan = puan + 10;
      mevcutSoru++;
      cevabaGoreMetin="";

    } else {
      puan = puan - 10;
      mevcutSoru++;
      cevabaGoreMetin=mevcutSoru.toString()+'. cevabı: '+sorular[mevcutSoru-1]['dogrucevap'];
    }
    if (mevcutSoru > 9) {
      mevcutSoru = 0;
      BitireYolla();
    }
  }

  @override
  Widget build(BuildContext context) {
    var cevaplistesi = [];
    cevaplistesi = sorular[mevcutSoru]['cevaplar'];
    return IntrinsicHeight(
      child: Scaffold(
        appBar: AppBar(leading: Icon(Icons.text_snippet_outlined),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.lightBlueAccent[400], Colors.red[700]],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            )),
          ),
          centerTitle: true,
          title: Text(
            'Matematik Kültürü',
            style: TextStyle(fontSize: 28.0, color: Colors.white),
          ),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ///puan ve soru bilgisi
                Expanded(
                  flex: 1,
                  child: Container(padding: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.lightBlueAccent[400], Colors.red[700]],
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                      )),
                   // color: Colors.lightBlueAccent[400],
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Puan: ' + puan.toString(), style: TextStyle(fontSize: 45.0,color: Colors.white)),
                        Text(' ' + (mevcutSoru + 1).toString() + ' / ' + sorular.length.toString(), style: TextStyle(fontSize: 40,color: Colors.white),),
                        Text(cevabaGoreMetin , style: TextStyle(fontSize: 30,color: Colors.white),),
                      ],
                    ),
                  ),
                ),
                ///sorular ve şıklar
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.lightBlueAccent[400],
                    alignment: Alignment.topCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[Padding(padding: EdgeInsets.only(top: 20)),
                        ///soru texti
                        Text(
                          sorular[mevcutSoru]['soru'].toString(),
                          style: TextStyle(fontSize: 28,color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        Padding(padding: EdgeInsets.only(top: 10.0)),
                        ///şıklar
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.white,
                              minimumSize: Size(220, 60),
                            ),
                            onPressed: () {
                              setState(() {
                                mevcutcevap = cevaplistesi[0].toString();
                              });
                              kontrolEt();
                            },
                            child: Text(
                              cevaplistesi[0],
                              style: TextStyle(fontSize: 24,color: Colors.black),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.white,
                              minimumSize: Size(220, 60),
                            ),
                            onPressed: () {
                              setState(() {
                                mevcutcevap = cevaplistesi[1].toString();
                              });
                              kontrolEt();
                            },
                            child: Text(
                              cevaplistesi[1],
                              style: TextStyle(fontSize: 24,color: Colors.black),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.white,
                              minimumSize: Size(220, 60),
                            ),
                            onPressed: () {
                              setState(() {
                                mevcutcevap = cevaplistesi[2].toString();
                              });
                              kontrolEt();
                            },
                            child: Text(
                              cevaplistesi[2],
                              style: TextStyle(fontSize: 24,color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
        ),
        floatingActionButton: FloatingActionButton(backgroundColor: Colors.red[600],
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          tooltip: 'return',
          child: Icon(Icons.home),
        ),
      ),
    );
  }
}
