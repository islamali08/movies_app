import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviapp/modules/home.dart';
import 'package:moviapp/modules/signup_screen.dart';
import 'package:moviapp/share/componont/componants.dart';
import 'package:moviapp/share/network/local/shared_pref.dart';
import 'package:moviapp/share/network/network/cupit/movie_cubit.dart';
import 'package:sizer/sizer.dart';

import 'auth.dart';


class onpordingthree extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [

          Container(
            height: 50.h,
            width: 100.w,

            child: Image(
                fit: BoxFit.fill,
                image: AssetImage(

                    'assets/onboarding.png'
                )),
          ),
          SizedBox(height: 5.h,),
          Text('Lorem ipsum dolor sit amet',

            style:TextStyle(
                fontSize: 18.sp,
                color: Colors.white
            ),
          ),
          SizedBox(height: 1.h,),

          Container(
              width: 25.h,
              child: Text('consecteur esplicit',
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white

                ),
              )),
          SizedBox(height: 3.h,),
          Container(
              width: 31.h,
              child: Text('Semper in cursus magna et eu',
                style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey

                ),
              )),
          Text('varius nunc adipiscing. Elementum',
            style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey
            ),
          ),
          Container(
              width: 31.h,
              child: Text('Semper in cursus magna et eu',
                style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey

                ),
              )),
          Text('parturient',
            style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey
            ),
          ),
          SizedBox(height: 9.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 7.w),
            child: Row(children: [
              Container(
                height: 1.5.h,
                width: 3.w,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(50.sp))

                ),
              ),

              SizedBox(width: 2.w,),
              Container(
                height: 1.5.h,
                width: 3.w,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(50.sp))

                ),
              ),
              SizedBox(width: 2.w,),
              Container(
                height: 1.h,
                width: 9.w,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20.sp))

                ),
              ),

              Spacer(),
              Container(
                  padding: EdgeInsets.all(8),
                  height: 10.h,
                  width: 10.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                      border: Border.all(
                          width: 2.sp,
                          color: Colors.lightBlue
                      ),
                      color: Colors.transparent
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                        color: Colors.blue
                    ),
                    child: IconButton(onPressed: (){
                      BlocProvider.of<moviecubit>(context).log= cashhelper.getdata(key: 'islog')??false;
                           BlocProvider.of<moviecubit>(context).log==false?navigate(context, signup()):navigate(context, homeScreen());
                    }, icon: Icon(Icons.arrow_forward_ios)),
                  ))

            ],),
          )







        ],
      ),
    );
  }
}
