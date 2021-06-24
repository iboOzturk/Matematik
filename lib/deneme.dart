import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'service.dart';


final userRef=FirebaseFirestore.instance.collection('Person');

class Deneme extends StatefulWidget {
  @override
  _DenemeState createState() => _DenemeState();
}

class _DenemeState extends State<Deneme> {
  @override
  void initState(){
    getUsers();
    super.initState();
  }
  final _firestore=FirebaseFirestore.instance;
  FirebaseAuth _auth=FirebaseAuth.instance;
  getUsers() {
    String nameRef=_auth.currentUser.uid;
    userRef.get().then((querySnapshots) {
      debugPrint("User koleksiyundaki eleman sayısı: "+ querySnapshots.docs.length.toString());
      for(int i=0;i<querySnapshots.docs.length;i++){
        debugPrint("Deneme: "+querySnapshots.docs[i].data().toString());
      }
      debugPrint(nameRef.toString());
    });
  }

  StatusService _statusService=StatusService();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(_statusService.isim),),
      body: FutureBuilder(
          future:_statusService.ArabalariAl(),
          builder: (context,listsnap) {
            if (listsnap.connectionState == ConnectionState.none &&
                listsnap.hasData == null) {
              print('project snapshot data is: ${listsnap.data}');
              return Container();
            }return _statusService.isim==null? CircularProgressIndicator():
            ListView.builder(
                itemCount: _statusService.carUz,
                itemBuilder: (context,i){
              return ListTile(
                title: Text('Marka: '+_statusService.arabaMarkalari[i]),
                subtitle: Container(
                  child: Column(
                    children: [
                      Text('Model: '+_statusService.arabaModelleri[i]),
                      Text('Hacim: '+_statusService.arabaHacimleri[i]),
                      Text('Güç: '+_statusService.arabaGucleri[i]),
                      Text('Yakıt: '+_statusService.arabaYakitlari[i]),
                      Text('Tip: '+_statusService.arabaTipleri[i]),
                    ],
                  ),
                ),
                trailing: Text('Fiyat: '+_statusService.arabaFiyatlari[i]),
              );
            });

          }),
    );
  }
}
/* return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ElevatedButton(onPressed: (){getUsers();},child: Text('Ampüle Bas'),),
      ),
    );
 */

