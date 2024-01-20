import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class HomePage extends StatefulWidget {
  final User? user;
  const HomePage({super.key, this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: ()async{
              await AuthService.logOut();
              },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text(widget.user?.displayName ?? "No name"),
            IconButton(
              onPressed: ()async{
                await AuthService.deleteAccount();
              },
              icon: const Icon(Icons.delete),
            )
          ],
        ),
      ),
    );
  }
}
