import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_g9/pages/home_page.dart';
import 'package:firebase_g9/pages/register_page.dart';
import 'package:firebase_g9/services/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                    hintText: "Email"
                ),
              ),
              TextField(
                controller: passController,
                decoration: const InputDecoration(
                    hintText: "Password"
                ),
              ),
              MaterialButton(
                onPressed: ()async{
                  User? user;
                  user = await AuthService.loginUser(context, emailController.text, passController.text);
                  if(user != null){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
                  }
                },
                child: const Text("Login"),
              ),

              MaterialButton(
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
                },
                child: const Text("Don't you have an account?"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
