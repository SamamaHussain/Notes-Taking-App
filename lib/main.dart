import 'package:authapp/Home/homePage.dart';
import 'package:authapp/Routes/routes.dart';
import 'package:authapp/firebase_options.dart';
import 'package:authapp/views/EmailVerificationView.dart';
import 'package:authapp/views/LoginView.dart';
import 'package:authapp/views/RegisterView.dart';
import 'package:authapp/views/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth App',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(),
        
        useMaterial3: false,
        
        ),
        
        home: const AuthView(),
        routes: {
          loginRoute: (context) => const LoginView(),
          registerRoute: (context) => const RegisterView(),
          homeRoute: (context) => const HomePage(),
          emailVerifyRoute: (context) => const EmailVerify(),
        },
      ),
      
    );
}



