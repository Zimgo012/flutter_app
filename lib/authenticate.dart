import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'homepage.dart';

class Authenticate extends StatelessWidget {
  const Authenticate({super.key});

  void onLogin(context) {
      Navigator.push(context,
      
      MaterialPageRoute(builder: (context) => Homepage())
      );
  }

  void onUserCreated(context){
    Navigator.pushReplacementNamed(context, '/sign-in');
  }

  @override
  Widget build(BuildContext context) {
    final providers = [EmailAuthProvider()];
    
          return SignInScreen(
            providers: providers,
            actions: [
              AuthStateChangeAction<UserCreated>((context, state) {
                
                onUserCreated(context);
              }),
              AuthStateChangeAction<SignedIn>((context, state) {
                onLogin(context);
              }),
            ],
          );
       
  }
}
