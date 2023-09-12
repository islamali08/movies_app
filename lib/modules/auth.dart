import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviapp/modules/home.dart';
import 'package:moviapp/modules/signup_screen.dart';

import 'login_screen.dart';

class authScreen extends StatefulWidget {
  const authScreen({Key? key}) : super(key: key);

  @override
  State<authScreen> createState() => _authScreenState();
}

class _authScreenState extends State<authScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
         if(snapshot.hasData)
           return homeScreen();
         else if(!snapshot.hasData)
           return signup();

         else
        return   CircularProgressIndicator();
        },


      ),
    );
  }
}
