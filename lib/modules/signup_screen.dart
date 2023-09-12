import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviapp/modules/sighn_up_screen.dart';
import 'package:sizer/sizer.dart';

import '../share/componont/componants.dart';
import 'login_screen.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image(
              fit: BoxFit.cover,
              width: 33.w,
                height: 15.h,
                image: AssetImage('assets/imgo.png')
            ),
            SizedBox(
              height: 3.h,
            ),
            Text('CINEMAX',
              style: TextStyle(
                fontSize: 27.sp,
                color: Colors.white
              ),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Text('Enter your registered ',
              style: TextStyle(
                fontSize: 17,
                color: Colors.grey
              ),
            ),
            Text('Phone Number to Sign Up',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey
              ),
            ),
            SizedBox(
              height: 6.h,
            ),

            defoltbuttom( name: 'Sign Up', onpris: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return  sightupscreen() ;
              },));

            }),
            SizedBox(
              height: 3.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('I already have an account?',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey
                  ),
                ),
                TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return loginscreen() ;
                },));
                  }, child: Text('Login',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff12CDD9)
                  ),
                ))
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Container(height: 1,
              width: 20.w,
                color: Colors.grey,

              ),
                SizedBox(width: 2.w,),
                Text('Or Sign up with',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey
                  ),

                ),
                SizedBox(width: 2.w,),

                Container(height: 1,
                  width: 20.w,
                  color: Colors.grey,

                ),

              ],),

            SizedBox(
              height: 5.h,
            ),
            
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 14.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [

                  roundboutom(
                      color: Colors.white,
                      wedjet: Image(image: AssetImage('assets/google-symbol 1.png'))),
                  roundboutom(
                      color: Colors.black,
                      wedjet: Image(image: AssetImage('assets/lastaple.png'))),
                  roundboutom(
                      color: Colors.blue,
                      wedjet: Image(image: AssetImage('assets/Vector.png')))


                ],
              ),
            )





          ],
        ),
      ),
    );
  }
}
