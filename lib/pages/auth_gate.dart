import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_g9/pages/home_page.dart';
import 'package:firebase_g9/pages/login_page.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      builder: (context, snapshot){
        log(snapshot.hasData.toString());
        if(snapshot.hasData){
          return const HomePage();
        }else{
          return const LoginPage();
        }
      },
      stream: FirebaseAuth.instance.authStateChanges(),
    );
  }
}
