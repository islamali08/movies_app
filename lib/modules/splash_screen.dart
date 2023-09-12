import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviapp/modules/detailsscreen.dart';
import 'package:moviapp/modules/signup_screen.dart';

import 'onbording_one.dart';
import 'oncording.dart';
import 'onpordind_two.dart';

class splashScreen extends StatefulWidget {




  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      // After 2 seconds, navigate to the main screen
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return onpording() ;
      },));
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(child:Container(
          height: 150,
          width: 150,

          child: Image(
            fit: BoxFit.fill,
            image: AssetImage(

                'assets/Group 22577.png'),
          ),
        )),
      ),
    );
  }
}
