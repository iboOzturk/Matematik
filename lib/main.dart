import 'package:flutter/material.dart';
import 'package:oyunkultur/deneme.dart';
import 'package:oyunkultur/giris.dart';

import 'Anamenu/Hesapmerkez/Geometriksekil/daire.dart';
import 'Anamenu/Hesapmerkez/Geometriksekil/dortgen.dart';
import 'Anamenu/Hesapmerkez/Geometriksekil/ucgen.dart';
import 'Anamenu/Hesapmerkez/basit.dart';
import 'Anamenu/Hesapmerkez/denklem.dart';
import 'Anamenu/Hesapmerkez/geometri.dart';
import 'Anamenu/Testler/bitir.dart';
import 'gecisekran.dart';
import 'home.dart';
import 'Anamenu/formuller.dart';
import 'Anamenu/hakkinda.dart';
import 'Anamenu/hesapmerkez.dart';
import 'Anamenu/testler.dart';
import 'package:firebase_core/firebase_core.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'anaekran',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      ///Navigasyon için rotalar
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/giris': (context) => GirisPage(),
        '/home': (context) => MyHomePage(),
        '/hesap': (context) => HesapPage(),
        '/hakkinda': (context) => Hakkinda(),
        '/testler': (context) => Testler(),
        '/formuller': (context) => Formuller(),
        '/geometri': (context) => Geometri(),
        '/ucgen': (context) => Ucgen(),
        '/dortgen': (context) => Dortgen(),
        '/daire': (context) => Daire(),
        '/denklem': (context) => Denklem(),
        '/basit': (context) => Basit(),
        '/bitir': (context) => Bitir(),
        '/deneme': (context) => Deneme(),

      },
    );
  }
}


