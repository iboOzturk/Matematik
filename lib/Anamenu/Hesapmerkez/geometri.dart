import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Geometri extends StatefulWidget {
  @override
  _GeometriState createState() => _GeometriState();
}

class _GeometriState extends State<Geometri> {
  Color arkaRenk=Colors.black;Color cizgiRenk=Colors.limeAccent;
  void modDegis(){
    setState(() {
      if(arkaRenk==Colors.black && cizgiRenk==Colors.limeAccent){
        arkaRenk=Colors.limeAccent;cizgiRenk=Colors.black;
      }
      else{arkaRenk=Colors.black;cizgiRenk=Colors.limeAccent;}
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:arkaRenk,
      appBar: AppBar(
        actions: [IconButton(icon: Icon(Icons.lightbulb), onPressed: modDegis)],
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                //colors: [Colors.black, Colors.limeAccent,Colors.black],
                colors: [arkaRenk, cizgiRenk,arkaRenk],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              )),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('Geometrik İşlemer',style: TextStyle(color: arkaRenk),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Çevre ve Alan:', style: TextStyle(fontSize: 30.0,color: cizgiRenk),),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            ///Üçgen butonu
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 60),
                    primary: arkaRenk,
                    onPrimary: cizgiRenk,
                    shape: BeveledRectangleBorder(
                      side: BorderSide(color: cizgiRenk,width: 1.3),
                      borderRadius: BorderRadius.circular(73),
                    ),
                ),
                onPressed: () {Navigator.pushNamed(context, ('/ucgen'));
                 // Navigator.push(context, MaterialPageRoute(builder: (context) => Ucgen()));
                },
                child: Text('Üçgen',style: TextStyle(fontSize: 18),)),
            Padding(padding: EdgeInsets.all(20)),
            ///dörtgen butonu
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: arkaRenk,
                  onPrimary: cizgiRenk,
                  side: BorderSide(color: cizgiRenk,width: 2),
                  minimumSize: Size(150, 60)
              ),
                onPressed: () {Navigator.pushNamed(context, ('/dortgen'));
                //Navigator.push(context, MaterialPageRoute(builder: (context) => Dortgen()));
                },
                child: Text('Dörtgen',style: TextStyle(fontSize: 18))),
            Padding(padding: EdgeInsets.all(20)),
            ///daire butonu
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(100,100),
                primary: arkaRenk,
                onPrimary: cizgiRenk,
                shape: CircleBorder(
                  side: BorderSide(color: cizgiRenk,width: 2),
                ),
              ),
                onPressed: () {Navigator.pushNamed(context, ('/daire'));
                //Navigator.push(context, MaterialPageRoute(builder: (context) => Daire()));
                },
                child: Text('Daire',style: TextStyle(fontSize: 18))),
            Padding(padding: EdgeInsets.only(bottom: 140)),
            Container(
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:<Widget>[
                  FlatButton(
                  color: cizgiRenk,
                  padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                  shape: CircleBorder(
                    //side: BorderSide(width: 2,color: Colors.limeAccent)
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, ('/hesap'));
                  },
                  child: Icon(Icons.keyboard_return,color:arkaRenk,size: 25,),
                ),
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    tooltip: 'return',
                    child: Icon(Icons.home,color:arkaRenk,),
                    backgroundColor: cizgiRenk,
                  ),
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}
