import 'package:authapp/Home/homePage.dart';
import 'package:authapp/views/LoginView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
          return const HomePage();
          }
          else{
            return LoginView();
          //  Navigator.of(context).pushNamedAndRemoveUntil(loginRoute, (_) => false);
          }

        },
      ); 
  }
}