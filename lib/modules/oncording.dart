
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'onbording_one.dart';
import 'onbording_three.dart';
import 'onpordind_two.dart';



class onpording extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Widget> screen =[
      onpordingScreen(),
      onpordTwo(),
      onpordingthree()
    ];
    return Scaffold(

      body: PageView.builder(
          itemCount: 3,
          itemBuilder:(context, index) =>screen[index] ,
          ),

    );
  }
}
