import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviapp/modules/signup_screen.dart';

import 'package:sizer/sizer.dart';

import '../share/network/network/cupit/move_state.dart';
import '../share/network/network/cupit/movie_cubit.dart';
import 'auth.dart';


class onpordTwo extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<moviecubit, moviesstate>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 3.h),
            child: Column(
              children: [
                Container(
                  height: 52.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 60.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            // Image border
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(48), // Image radius
                              child: Image.network(
                                  width: 30.w,
                                  '${'https://image.tmdb.org/t/p/w500'}${BlocProvider.of<moviecubit>(context).movie!.film![index].poster_path}',
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Lorem ipsum dolor sit',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  'amet consecteur esplicit',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  'Semper in cursus magna et eu varius nunc . ',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                Text(
                  'adipiscing Elementum justo, laoreet id sem ',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                Text(
                  ' semper parturient. ',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                  child: Row(
                    children: [
                      Container(
                        height: 1.5.h,
                        width: 3.w,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.sp))),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Container(
                        height: 1.h,
                        width: 9.w,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.sp))),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Container(
                        height: 1.5.h,
                        width: 3.w,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.sp))),
                      ),
                      Spacer(),
                      Container(
                          padding: EdgeInsets.all(8),
                          height: 10.h,
                          width: 10.h,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.sp)),
                              border: Border.all(
                                  width: 2.sp, color: Colors.lightBlue),
                              color: Colors.transparent),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.sp)),
                                color: Colors.blue),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return authScreen();
                                    },
                                  ));
                                },
                                icon: Icon(Icons.arrow_forward_ios)),
                          ))
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
