import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //giriş yap fonksiyonu
  Future<String> signIn({ String email,  String password}) async {
    try{
      await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Welcome";
    }on FirebaseAuthException catch(e){
      if(e.code=='user-not-found'){
        return 'Bulunamadı';
      }else if(e.code=='wrong-password'){
        return 'kotu sifre';
      }
      return '';
    }
  }

  //çıkış yap fonksiyonu
  signOut() async {
    return await _auth.signOut();
  }

  //kayıt ol fonksiyonu
  Future<String> createPerson(
      { String name,  String email,  String password}) async {

    try{
      var user=_auth.currentUser.uid;
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _firestore
          .collection("Insan")
          .doc(user)
          .set({'name': name, 'email': email,'sifre':password});
      return "Olusturuldu";
    }on FirebaseAuthException catch(e){
      if(e.code=='wrong-password'){
        return 'Sifre kotu';
      }else if(e.code=='email-already-in-use'){
        return 'bu hesap var ';
      }
    }
    catch(e){
      return "Hatalı Giris: "+e.toString();
    }
    return 'Hatalı giris';

  }
  Future<String> resetPass({ String email}) async{
    try{
      await _auth.sendPasswordResetEmail(email: email);
      return 'Email Gonderildi';
    }catch(e){
      return 'Hatali Giris';
    }
  }
  Stream<QuerySnapshot> getStatus() {
    var ref = _firestore.collection("Insan").snapshots();
    return ref;
  }
}