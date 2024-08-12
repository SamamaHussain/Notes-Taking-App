import 'package:authapp/Routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {


    final emailcontroller=TextEditingController();
    final passwordcontroller=TextEditingController();

    @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  Future signup() async{
    try{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailcontroller.text, 
      password: passwordcontroller.text
      );
      Navigator.of(context).pushNamed(emailVerifyRoute);
    }
    on FirebaseAuthException catch(e){
      if (e.code == 'invalid-email') {
        print('Your Email is Invalid');
      }if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(children: [
            TextField(
              controller: emailcontroller,
              decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Email',
          ),
            ),
            SizedBox(width: 10, height: 10),
            TextField(
              controller: passwordcontroller,
              decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
          ),
            ),
            SizedBox(width: 10, height: 10),
            TextButton(
              onPressed: () {
                signup();
              }, 
            child: const Text('Register')),
            SizedBox(width: 10, height: 10),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(loginRoute, (_) => false);
              }, 
            child: const Text('Aleready have an Account? Sign In Here!'))
          ],
          ),
        ),
      ),
    );
  }
}

