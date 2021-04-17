import 'package:flutter/material.dart';
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(
          ///appbar dekarasyonu
          centerTitle: true,
          elevation: 20,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange, Colors.red],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                )),
          ),
          leading: Icon(Icons.home),
          title: Text(
            'Anamenü',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ///Formuller butonu
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: RaisedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/formuller');
                    },
                    icon: Icon(Icons.info),
                    label: Text('Formuller', style: TextStyle(fontSize: 20.0),),
                    color: Colors.red,
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                        side: BorderSide(width: 3, color: Colors.black)),
                  ),
                ),
                ///Hesaplama Butonu
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: RaisedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/hesap');
                    },
                    icon: Icon(Icons.calculate),
                    label: Text('Hesaplama', style: TextStyle(fontSize: 20.0),),
                    color: Colors.red,
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                        side: BorderSide(width: 3, color: Colors.black)),
                  ),
                ),
                ///Testler Butonu
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: RaisedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/testler');
                    },
                    icon: Icon(Icons.text_snippet),
                    label: Text('Testler', style: TextStyle(fontSize: 20.0),),
                    color: Colors.red,
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                        side: BorderSide(width: 3, color: Colors.black)),
                  ),
                ),
                ///Hakkında Butonu
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: RaisedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/hakkinda');
                    },
                    icon: Icon(Icons.person),
                    label: Text('Hakkında', style: TextStyle(fontSize: 20.0),),
                    color: Colors.red,
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                        side: BorderSide(width: 3, color: Colors.black)),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}