import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviapp/share/network/local/shared_pref.dart';
import 'package:moviapp/share/network/network/cupit/dio_helper.dart';
import 'package:moviapp/share/network/network/cupit/move_state.dart';
import 'package:moviapp/share/network/network/cupit/movie_cubit.dart';
import 'package:sizer/sizer.dart';

import 'modules/detailsscreen.dart';
import 'modules/splash_screen.dart';

void main() async {
await  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
diohelper.init();
await cashhelper.init() ;

runApp( Sizer(
  builder: (context, orientation, deviceType) {
    return MyApp() ;
  },


));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return BlocProvider(


      create: (context) => moviecubit()..getpopular()..getrelate()..getall()..comedymovies()..getsercscreen('spiderman'),

      child: BlocConsumer<moviecubit,moviesstate>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return  MaterialApp(

            debugShowCheckedModeBanner: false ,
            theme: ThemeData(

                checkboxTheme:  CheckboxThemeData(

                ),


                appBarTheme: AppBarTheme(
                    color: Color(0xff1F1D2B)
                ),
                scaffoldBackgroundColor:Color(0xff1F1D2B)
            ),
            home: splashScreen(),
            color:Color(0xff1F1D2B) ,
          );
        },
      ),
    );
  }
}
