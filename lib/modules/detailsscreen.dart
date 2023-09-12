import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviapp/share/network/local/shared_pref.dart';
import 'package:moviapp/share/network/network/cupit/movie_cubit.dart';
import 'package:sizer/sizer.dart';

import '../share/componont/componants.dart';

class detailsScreen extends StatelessWidget {
String title ;
String image ;
String details ;

detailsScreen(this.title, this.image, this.details);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [



            Stack(
              children: [
                // Background Image
                Image.network(
                  '${'https://image.tmdb.org/t/p/w500'}${image}', // Replace with your image path
                  width: double.infinity,
                  height: 65.h,
                  fit: BoxFit.cover,
                ),
                // Blurry Overlay
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 6), // Adjust blur intensity
                  child: Container(
                    color: Colors.black.withOpacity(0), // Adjust opacity as needed
                  ),
                ),
                // Your Content
               Positioned(
                 right: 20.w,
                   bottom: 5.h,
                 child: Image.network(
                     height: 55.h,
                     width: 60.w,

                     '${'https://image.tmdb.org/t/p/w500'}${image}'

                 ),


               ),

                Positioned(
                  top: 5.h,
                  child: Row(
                    children: [
                      IconButton(onPressed: (){
                        Navigator.pop(context);

                      }, icon: Icon(Icons.arrow_back,
                        color: Colors.white,
                      )),
                                SizedBox(width: 5.w,),

                      Text(title,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                        ),
                      )
                    ],
                  ),
                ),



                Positioned(
                  bottom: 1.h,
                  right: 13.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_month_rounded,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 1.w,
                      ),

                      Container(
                        width: 10.w,
                        child: Text(
                          cashhelper.getdata(
                            key: 'date',
                          ),
                          style: TextStyle(

                              fontSize: 12.sp, color: Colors.grey),
                          maxLines: 1,
                        ),
                      ),

                      SizedBox(width: 2.w,),
                      SizedBox(
                        width: 1.h,
                      ),
                      Icon(
                        Icons.access_time_filled,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text(
                        '148 Minutes',
                        style: TextStyle(
                            fontSize: 12.sp, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 3.h,
                      ),
                      Icon(
                        Icons.movie,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text(
                        'Action',
                        style: TextStyle(
                            fontSize: 12.sp, color: Colors.grey),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 5.h,),
            Row(
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Container(height: 7.h,
                width: 27.w,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Icon(Icons.play_arrow,
                    color: Colors.white,
                      size: 30,
                  ),
                  SizedBox(width: 1.5.w,),
                  Text('Play',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18
                    ),
                  )
                ]),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.all(Radius.circular(20.sp))
                ),
                      
              ),
                SizedBox(width: 2.w,),
                roundboutom(
                    color: Color(0xff252836),
                    wedjet:Icon(Icons.download,
    color: Colors.orange,
    ),),
                SizedBox(width: 2.w,),

                roundboutom(wedjet: Icon(Icons.share), color: Color(0xff252836))
            ],


    ),


            SizedBox(height: 3.h,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Story Line',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(details,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}
