import 'package:authapp/Routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});


  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final _emailcontroller=TextEditingController();
  final _passwordcontroller=TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  Future login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailcontroller.text.trim(),
          password: _passwordcontroller.text.trim());
          User? user = FirebaseAuth.instance.currentUser;
    bool? isEmailVerified = user?.emailVerified;

if(user!=null){
      if (isEmailVerified == true) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        homeRoute,
        (route) => false,
      );
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil(
        emailVerifyRoute,
        (_) => false,
      );
    }
}

    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'invalid-email') {
        print('Your Email is Invalid');
      } else if (e.code == 'wrong-password') {
        print('Incorrect Password');
      } else if (e.code == 'user-not-found') {
        print('This Email is Not registered');
      } else {
        print('Something Went Wrong');
      }
    }
    final user = FirebaseAuth.instance.currentUser;
    print(user);
  }
  check_userStatus() {


  }
  
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(children: [
            TextField(
              controller: _emailcontroller,
              decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Email',
          ),
            ),
            SizedBox(width: 10, height: 10),
            TextField(
              controller: _passwordcontroller,
              decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
          ),
            ),
            SizedBox(width: 10, height: 10),
            TextButton(
              onPressed: () {
               login();
              //  check_userStatus();
              }, 
            child: const Text('Login')),
            SizedBox(width: 10, height: 10),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(registerRoute, (_) => false);
              }, 
            child: const Text('Not Register Yet? Register Here!'))
          ],
          ),
        ),
      ),
    );
  }
}