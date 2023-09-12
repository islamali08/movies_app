import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviapp/modules/signup_screen.dart';
import 'package:moviapp/share/network/local/shared_pref.dart';
import 'package:moviapp/share/network/network/cupit/movie_cubit.dart';
import 'package:sizer/sizer.dart';

import '../share/componont/componants.dart';
import '../share/network/network/cupit/move_state.dart';
import 'auth.dart';
import 'home.dart';


class loginscreen extends StatelessWidget {
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController name = TextEditingController();

String? emai  ;
String? pass ;

Future Siginin () async{
  await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text.trim(), password: password.text.trim());
}
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  elevation: 0.0,
  title:Text('Login') ,
  centerTitle: true,
  leading: IconButton(icon:Icon(Icons.arrow_back_ios), onPressed: () {
    Navigator.pop(context);

  },),
),
      body:BlocConsumer<moviecubit,moviesstate>(


        listener: (BuildContext context, Object? state) {  },


        builder: (BuildContext context, state) {

          return Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
            child: SingleChildScrollView(
              child: Column(
                children: [

                  Text('Hi, ${cashhelper.getdata(key: 'name')}',
                    style: TextStyle(
                        fontSize: 25.sp,
                        color: Colors.white
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  Text('Welcome back! Please enter ',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey
                    ),
                  ),
                  Text('your details.',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey
                    ),

                  ),
                  SizedBox(height: 6.h,),

                  customtextform(hinttext: "  name",control: name,onchange: emai),
                  SizedBox(height: 4.h,),

                  customtextform(hinttext: "  Email Address",control: email,onchange: emai),
                  SizedBox(height: 4.h,),
                  customtextform(hinttext: "  Password",control: password,onchange: pass),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(onPressed: (){}, child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: Colors.grey
                      ),
                    )),
                  ),
                  SizedBox(height: 5.h,),

                  defoltbuttom(onpris: (){

                    BlocProvider.of<moviecubit>(context).Siginin(email.text.trim(),password.text.trim(),name.text).then((value) {
                      if(BlocProvider.of<moviecubit>(context).log==true)
                        navigate(context, homeScreen());
                    });



                  },name: 'login')




                ],
              ),
            ),
          ) ;
        },

      )
    );
  }
}
