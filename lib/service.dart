import 'dart:io';
import 'carDetay.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class StatusService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String isim='';
  String model='';
  String marka='';
  String fiyat='';
  String hacim='';
  String guc='';
  String yakit='';
  String tip='';
  int carUz;
  List<String> arabaModelleri;
  List<String> arabaMarkalari;
  List<String> arabaHacimleri;
  List<String> arabaGucleri;
  List<String> arabaYakitlari;
  List<String> arabaTipleri;
  List<String> arabaFiyatlari;
  //status eklemek için


  Stream<QuerySnapshot> getCarDetay() {
    var ref = _firestore.collection("ArabaDetay").snapshots();
    carDetay.get().then((value) {
      print(value.docs.length.toString());
      var r1=value.docs.length;
      return r1.toString();
    });
    return ref;
  }
  ArabaEkle(String carMarka,String carModel,String carFiyat,String carMotorHacmi,String carMotorGuc,String carYakit,String carTip) async{
    CollectionReference collectionReference1=FirebaseFirestore.instance.collection('ArabaDetay');
    var documentRef=await collectionReference1.add(
        {'marka': '$carMarka','model': '$carModel','fiyat': '$carFiyat','motor hacmi': '$carMotorHacmi',
          'motor güç':'$carMotorGuc','yakıt':'$carYakit','tip':'$carTip'});
    return CarDetay(id: documentRef.id,carModel: carModel,carMarka: carMarka,
        carFiyat: carFiyat,carMotorHacmi:carMotorHacmi,carMotorGuc: carMotorGuc,carYakit: carYakit,
        carTip: carTip
    );
  }
  Stream<QuerySnapshot> getCarDetay2() {
    var ref = _firestore.collection("Person").doc(_auth.currentUser.uid).collection('Arabalar').snapshots();
    carDetay.get().then((value) {
      print(value.docs.length.toString());
      var r1=value.docs.length;
      return r1.toString();
    });
    return ref;
  }

  Future ArabalariAl() async{
    var isimref=await _firestore.collection('Person').doc(_auth.currentUser.uid).get();
    var isimK= isimref.data()['userName'];
    print('isim: '+isimref.toString());
    isim=isimK;

    var ref=await _firestore.collection('Person').doc(_auth.currentUser.uid).collection('Arabalar').get();
    carUz=ref.docs.length;
    var liste=ref.docs.toList();
    arabaFiyatlari=List<String>();
    arabaMarkalari=List<String>();
    arabaModelleri=List<String>();
    arabaHacimleri=List<String>();
    arabaGucleri=List<String>();
    arabaYakitlari=List<String>();
    arabaTipleri=List<String>();
    liste.forEach((element) {
      print(element.data());
     arabaMarkalari.add(element.data()['marka']);
     arabaModelleri.add(element.data()['model']);
     arabaHacimleri.add(element.data()['motor hacmi']);
     arabaGucleri.add(element.data()['motor gücü']);
     arabaYakitlari.add(element.data()['yakıt']);
     arabaTipleri.add(element.data()['tip']);
     arabaFiyatlari.add(element.data()['fiyat']);

    });

  }
  Stream<DocumentSnapshot> getU(){
    var uRef=_firestore.collection('Person').doc(_auth.currentUser.uid).snapshots();
    return uRef;
  }
  ArabaEkle2(String carMarka,String carModel,String carFiyat,String carMotorHacmi,String carMotorGuc,String carYakit,String carTip) async{
    CollectionReference collectionReference1=FirebaseFirestore.instance.collection('Person').doc(_auth.currentUser.uid).collection('Arabalar');
    var documentRef=await collectionReference1.add(
        {'marka': '$carMarka','model': '$carModel','fiyat': '$carFiyat','motor hacmi': '$carMotorHacmi',
          'motor güç':'$carMotorGuc','yakıt':'$carYakit','tip':'$carTip'});
    return CarDetay(id: documentRef.id,carModel: carModel,carMarka: carMarka,
        carFiyat: carFiyat,carMotorHacmi:carMotorHacmi,carMotorGuc: carMotorGuc,carYakit: carYakit,
        carTip: carTip
    );
  }
  Stream<QuerySnapshot> getCarStatus() {
    var ref = _firestore.collection("ArabaStatus").snapshots();

    return ref;
  }
  final userRef=FirebaseFirestore.instance.collection('Person');
  getUsers() {
    userRef.get().then((querySnapshots) {
      print("User koleksiyundaki eleman sayısı: "+ querySnapshots.docs.length.toString());
    });
  }
  final carDetay=FirebaseFirestore.instance.collection('ArabaDetay');
  getCarCount(){
    carDetay.get().then((value) {
      print(value.docs.length.toString());
      var r1=value.docs.length;
      return r1.toString();
    });
  }


  ekleVeri(String carMarka,String carModel,String carFiyat){
    CollectionReference collectionReference=FirebaseFirestore.instance.collection('Deneme');
    collectionReference.add({'Marka': '$carMarka','Model': '$carModel','Fiyat': '$carFiyat'});
  }

  //status göstermek için
  Stream<QuerySnapshot> getStatus() {
    var ref = _firestore.collection("Status").snapshots();

    return ref;
  }

  //status silmek için
  Future<void> removeStatus(String docId) {
    var ref = _firestore.collection("ArabaDetay").doc(docId).delete();

    return ref;
  }
}