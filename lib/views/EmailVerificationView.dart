import 'package:authapp/Routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class EmailVerify extends StatefulWidget {
  const EmailVerify({super.key});

  @override
  State<EmailVerify> createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Your Email'),

      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(children: [
                const Text('Your Email is not Verified. Please verify your email first to login.',
                style: TextStyle(fontSize: 20),),
                TextButton(onPressed: () async{
                  final user =FirebaseAuth.instance.currentUser;
            
                  await user?.sendEmailVerification();
          
                  verifymessage(context);
                }, 
                child: const Text("Send Email Verifaction Link")
                ),
                
                TextButton(onPressed: () async{
                  final user =FirebaseAuth.instance.currentUser;
                  if(user!=null){
                    await FirebaseAuth.instance.signOut();  
                  }
                  print(user);
                  Navigator.of(context).pushNamedAndRemoveUntil(loginRoute, (_) => false);
                }, child: const Text('Verified Your Email? Login Here!'))
              ],
          ),
        ),
      ),
    );
  }
}

 void verifymessage(BuildContext content){
  showDialog(context: content, builder: (BuildContext context){
    return AlertDialog(
      title: const Text("Email Sent!"),
      content: const Text('A Link to verify your account is sent on your Email click that link to verify your email'),
      actions: [
        TextButton(onPressed: (){
          Navigator.of(context).pop();
        }, child: const Text('OK'))
      ],
    );
  },
  );
 }