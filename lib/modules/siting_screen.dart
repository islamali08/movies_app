import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviapp/modules/login_screen.dart';
import 'package:moviapp/share/componont/componants.dart';
import 'package:moviapp/share/network/local/shared_pref.dart';
import 'package:sizer/sizer.dart';

import '../share/network/network/cupit/movie_cubit.dart';

class sitingScreen extends StatelessWidget {
  const sitingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('Profile',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white
                  ),
                ),
                SizedBox(height: 3.h,),
                Container (
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  height: 10.h,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.2.sp,
                      
                    )
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        child: Image(
                            height: 13.h,
                            width: 12.w,
                            image:
                            AssetImage('assets/pf-removebg-preview.png')),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Hi, ${cashhelper.getdata(key: 'name')}',
                            style: TextStyle(
                                fontSize: 15.sp, color: Colors.white),
                          ),
                          Text(
                            cashhelper.getdata(key: 'email'),
                            style: TextStyle(
                                fontSize: 15.sp, color: Colors.grey),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 3.h,),

                Container(
                  padding: EdgeInsets.all(15),
                  height: 20.h,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Premium Member',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 1.h,),
                      Text('New movies are coming for you,\n Download Now!',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                ),
                SizedBox(height: 3.h,),
                
                Container(
                  padding: EdgeInsets.all(10),

                  height: 25.h,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Account',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),
                      ),
                      SizedBox(height: 2.h,),
                      Row(
                        children: [
                          Container(
                            height: 6.h,
                            width: 12.w,
                            child: Icon(Icons.person,
                              size: 30,
                              color: Colors.grey,
                            ),
                            decoration: BoxDecoration(
                               color: Color(0xff252836),
                              borderRadius: BorderRadius.all(Radius.circular(20.sp))
                            ),
                          ),
                          SizedBox(width: 5.w,),
                          Text('Member',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios,
                            color: Colors.grey,
                          )
                        ],
                      ),
Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Divider(

    color: Colors.grey,





  ),
),

                      Row(
                        children: [
                          Container(
                            height: 6.h,
                            width: 12.w,
                            child: Icon(Icons.lock,
                              size: 25,
                              color: Colors.grey,
                            ),
                            decoration: BoxDecoration(
                                color: Color(0xff252836),
                                borderRadius: BorderRadius.all(Radius.circular(20.sp))
                            ),
                          ),
                          SizedBox(width: 5.w,),
                          Text('Change Password',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios,
                            color: Colors.grey,
                          )
                        ],
                      ),


                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(
                        color: Colors.grey,

                        width: 1.5),

                  ),

                ),
                SizedBox(height: 3.h,),
                Container(
                  padding: EdgeInsets.all(10),

                  height: 47.h,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('General',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),
                      ),
                      SizedBox(height: 2.h,),
                      Row(
                        children: [
                          Container(
                            height: 6.h,
                            width: 12.w,
                            child: Icon(Icons.notifications,
                              size: 30,
                              color: Colors.grey,
                            ),
                            decoration: BoxDecoration(
                                color: Color(0xff252836),
                                borderRadius: BorderRadius.all(Radius.circular(20.sp))
                            ),
                          ),
                          SizedBox(width: 5.w,),
                          Text('Notification',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios,
                            color: Colors.grey,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:   Divider(
                               thickness: 1,
                          color: Colors.grey,





                        ),
                      ),

                      Row(
                        children: [
                          Container(
                            height: 6.h,
                            width: 12.w,
                            child: Icon(Icons.language,
                              size: 25,
                              color: Colors.grey,
                            ),
                            decoration: BoxDecoration(
                                color: Color(0xff252836),
                                borderRadius: BorderRadius.all(Radius.circular(20.sp))
                            ),
                          ),
                          SizedBox(width: 5.w,),
                          Text('Language',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios,
                            color: Colors.grey,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:   Divider(
                          thickness: 1,
                          color: Colors.grey,





                        ),
                      ),

                      Row(
                        children: [
                          Container(
                            height: 6.h,
                            width: 12.w,
                            child: Icon(Icons.flag,
                              size: 25,
                              color: Colors.grey,
                            ),
                            decoration: BoxDecoration(
                                color: Color(0xff252836),
                                borderRadius: BorderRadius.all(Radius.circular(20.sp))
                            ),
                          ),
                          SizedBox(width: 5.w,),
                          Text('Country',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios,
                            color: Colors.grey,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:   Divider(
                          thickness: 1,
                          color: Colors.grey,





                        ),
                      ),

                      Row(
                        children: [
                          Container(
                            height: 6.h,
                            width: 12.w,
                            child: Icon(Icons.cleaning_services,
                              size: 25,
                              color: Colors.grey,
                            ),
                            decoration: BoxDecoration(
                                color: Color(0xff252836),
                                borderRadius: BorderRadius.all(Radius.circular(20.sp))
                            ),
                          ),
                          SizedBox(width: 5.w,),
                          Text('Clear Cache',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios,
                            color: Colors.grey,
                          )
                        ],
                      ),


                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(
                        color: Colors.grey,

                        width: 1.5),

                  ),

                ),
                SizedBox(height: 3.h,),
                Container(
                  padding: EdgeInsets.all(10),

                  height: 37.h,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('More',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),
                      ),
                      SizedBox(height: 2.h,),
                      Row(
                        children: [
                          Container(
                            height: 6.h,
                            width: 12.w,
                            child: Icon(Icons.local_police,
                              size: 30,
                              color: Colors.grey,
                            ),
                            decoration: BoxDecoration(
                                color: Color(0xff252836),
                                borderRadius: BorderRadius.all(Radius.circular(20.sp))
                            ),
                          ),
                          SizedBox(width: 5.w,),
                          Text('Legal and Policies',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios,
                            color: Colors.grey,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:   Divider(
                          thickness: 1,
                          color: Colors.grey,





                        ),
                      ),

                      Row(
                        children: [
                          Container(
                            height: 6.h,
                            width: 12.w,
                            child: Icon(Icons.help_outlined,
                              size: 25,
                              color: Colors.grey,
                            ),
                            decoration: BoxDecoration(
                                color: Color(0xff252836),
                                borderRadius: BorderRadius.all(Radius.circular(20.sp))
                            ),
                          ),
                          SizedBox(width: 5.w,),
                          Text('Help & Feedback',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios,
                            color: Colors.grey,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:   Divider(
                          thickness: 1,
                          color: Colors.grey,





                        ),
                      ),

                      Row(
                        children: [
                          Container(
                            height: 6.h,
                            width: 12.w,
                            child: Icon(Icons.quiz_sharp,
                              size: 25,
                              color: Colors.grey,
                            ),
                            decoration: BoxDecoration(
                                color: Color(0xff252836),
                                borderRadius: BorderRadius.all(Radius.circular(20.sp))
                            ),
                          ),
                          SizedBox(width: 5.w,),
                          Text('About Us',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios,
                            color: Colors.grey,
                          )
                        ],
                      ),


                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(
                        color: Colors.grey,

                        width: 1.5),

                  ),

                ),
                SizedBox(height: 3.h,),
              Container(
                width: double.infinity,
                height: 8.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: Colors.grey,
                    width: 1.5
                  )
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    backgroundColor: Colors.transparent
                  ),
                  onPressed: (){
                   FirebaseAuth.instance.signOut().then((value) {
                     cashhelper.savedata(key: 'islog', value: false)       ;


                   });
                   BlocProvider.of<moviecubit>(context).log==false ;
navigate(context, loginscreen()
)        ;          },
                  child: Text('Log Out',
                    style: TextStyle(
                      fontSize: 21
                    ),
                  ),
                ),
              )




              ],
            ),
          ),
        ),
      ),
    );
  }
}
