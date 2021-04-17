import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Formuller extends StatefulWidget {
  @override
  _FormullerState createState() => _FormullerState();
}

class _FormullerState extends State<Formuller> {
  final TextStyle metinstil =
      TextStyle(fontSize: 17, fontWeight: FontWeight.w500, height: 2);
  final TextStyle baslikstil = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      height: 2,
      decoration: TextDecoration.underline,
      decorationThickness: 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.greenAccent[100],
        title: Text(
          'Formuller',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          iconSize: 30,
          splashColor: Colors.orange,
        ),
      ),
      body: Center(
        child: IntrinsicHeight(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ///Özdeşikler
               Expanded(flex: 1,
                    child: Container(
                      color: Colors.greenAccent,
                      alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Text('Özdeşikler:', style: baslikstil),
                            Text('• (a+b)^2=a^2+b^2+2*a*b \n'
                                '• (a-b)^2=a^2+b^2-2*a*b \n'
                                '• a^2-b^2=(a+b)(a-b) \n'
                                '• a^2+b^2=(a+b)^2-2ab \n'
                                '• a^3+b^3=(a+b)(a^2-ab+b^2) \n'
                                '• a^3-b^3=(a-b)(a^2+ab+b^2)',
                                style: metinstil,
                      ),
                            Padding(padding: EdgeInsets.only(bottom: 10))
                    ],
                  ),
                )),
              ///Trigonometri
              Expanded(flex: 1,
                    child: Container(
                     alignment: Alignment.center, color: Colors.greenAccent[400],
                       child: Column(
                         children: <Widget>[
                              Text('Trigonometri', style: baslikstil,),
                              Text('• sin(pi-a)= +sina \n'
                                   '• cos(pi-a)= -cosa \n'
                                   '• sin(pi+a)= -sina \n'
                                   '• cos(pi+a)= -cosa \n'
                                   '• sin2a=2.sina.cosa \n'
                                   '• cos2a=cos^2(a)-sin^2(a) ',
                                    style: metinstil,
                                   ),
                           Padding(padding: EdgeInsets.only(bottom: 57.5))
                         ],
                  ),
                )),
            ],
          ),
        ),
      ),
    );
  }
}
