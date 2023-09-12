import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviapp/modules/login_screen.dart';
import 'package:moviapp/share/network/local/shared_pref.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../share/componont/componants.dart';
import '../share/network/network/cupit/move_state.dart';
import '../share/network/network/cupit/movie_cubit.dart';


bool ischec = false;

class sightupscreen extends StatelessWidget {



  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void signUpWithEmailAndPassword(String email, String password) async {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        ).then((value) {
          if   (value != null ){

            navigate(context, loginscreen())  ;
          }

        });
        // Sign-up successful, you can navigate to another screen or perform further actions.
      } catch (e) {
        // Handle sign-up errors here (e.g., show an error message to the user).
        print(e.toString());
      }
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Sign Up'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);

          },
        ),
      ),
      body: BlocConsumer<moviecubit, moviesstate>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'Let’s get started',
                      style: TextStyle(fontSize: 25.sp, color: Colors.white),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      'The latest movies and series ',
                      style: TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                    Text(
                      'are here',
                      style: TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    customtextform(hinttext: "  Full Name", control: name),
                    SizedBox(
                      height: 4.h,
                    ),
                    customtextform(hinttext: "  Email Address",control:email ),
                    SizedBox(
                      height: 4.h,
                    ),
                    customtextform(hinttext: "  Password",control: password),
                    SizedBox(
                      height: 4.h,
                    ),
                    Row(
                      children: [
                        Checkbox(


                            value: BlocProvider.of<moviecubit>(context).ischec,
                            onChanged: (value) {
                              BlocProvider.of<moviecubit>(context).checbox(value!);
                            }),
                        Text(
                          'I agree to the Terms and Services \n and Privacy Policy',
                          style: TextStyle(fontSize: 17, color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    
                    defoltbuttom(name: 'Sign Up', onpris: (){
                      signUpWithEmailAndPassword(email.text,password.text);

                      cashhelper.savedata(key: 'name', value: name.text);

                    })
                    
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
