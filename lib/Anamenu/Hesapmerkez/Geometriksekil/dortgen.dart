import 'package:flutter/material.dart';
class Dortgen extends StatefulWidget {
  @override
  _DortgenState createState() => _DortgenState();
}

class _DortgenState extends State<Dortgen> {
  double g = 0.0, y = 0.0, cevre = 0.0, alan = 0.0;
  String cevresnc = " ";
  String alansnc = " ";
  TextEditingController kont1 = TextEditingController(text: "");
  TextEditingController kont2 = TextEditingController(text: "");

  void Hesapla() {
    setState(() {
      g = double.parse(kont1.text);
      y = double.parse(kont2.text);
      cevre = 2*(g+y);
      alan = g*y;
      cevresnc = "Çevre: " + cevre.toString();
      alansnc = "Alan: " + alan.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.orange,Colors.lightBlueAccent])),
        ),
        centerTitle: true,
        title: Text('Dörtgen'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image(
                image: AssetImage('lib/images/dortgen.JPG'),
              ),
              TextFormField(
                style: TextStyle(fontSize: 20.0),
                decoration: const InputDecoration(
                  hintText: 'Genişliği giriniz: ',
                ),
                keyboardType: TextInputType.number,
                controller: kont1,
              ),
              TextFormField(
                style: TextStyle(fontSize: 20.0),
                decoration: const InputDecoration(
                  hintText: 'Yüksekliği giriniz: ',
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
