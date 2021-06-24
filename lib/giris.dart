import 'package:flutter/material.dart';
import 'home.dart';

import 'auth_service.dart';


class GirisPage extends StatefulWidget {
  @override
  _GirisPageState createState() => _GirisPageState();
}

class _GirisPageState extends State<GirisPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  AuthProvider _authProvider=AuthProvider();
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Emailinizi giriniz: '),
              controller: _emailController,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Şifrenizi giriniz: '),
              controller: _passwordController,
            ),
            ElevatedButton(onPressed: () {
              setState(() {
                isLoading=true;
              });
              /* _authService.signIn(_emailController.text, _passwordController.text).
              then((value) {
                return Navigator.pushNamed(context, '/home');
              }); */
              _authProvider.signIn(
                  email: _emailController.text, password: _passwordController.text)
                  .then((value) {
                if(value=="Welcome"){
                  setState(() {
                    isLoading=false;
                  });
                  Navigator.pushNamed(context, '/deneme');
                }else{
                  setState(() {
                    isLoading=false;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
                }
              });
              // Navigator.pushNamed(context, '/home');
            }
                ,child: Text('Giriş Yap')
            ),

          ],
        ),
      ),
    );
  }
}
