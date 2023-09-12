import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviapp/share/componont/componants.dart';
import 'package:moviapp/share/network/local/shared_pref.dart';
import 'package:moviapp/share/network/network/cupit/move_state.dart';
import 'package:sizer/sizer.dart';

import '../share/network/network/cupit/movie_cubit.dart';
import 'detailsscreen.dart';

class searchresult extends StatelessWidget {
String? title ;
  @override
  Widget build(BuildContext context) {
    return   BlocConsumer<moviecubit,moviesstate>(

      listener: (BuildContext context, Object? state) {


        if(state is scsusesstate){
          title = BlocProvider.of<moviecubit>(context).sc!.scm![0].original_title ;
        }
      },




      builder: (BuildContext context, state) {

        return  Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0.0,
            title: Text(title??'no result') ,
          ),
          body: BlocBuilder<moviecubit,moviesstate>(
            builder: (context, state) {
              if(state is sclodingstate)
                return CircularProgressIndicator();
              else if(state is scsusesstate){

                return  ListView.builder(
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: BlocProvider.of<moviecubit>(context)
                      .sc!
                      .scm!
                      .length,
                  itemBuilder: (context, index) {
                    return  GestureDetector(
                      onTap: (){
                             navigate(context, detailsScreen(BlocProvider.of<moviecubit>(context).sc!.scm![index].original_title!,BlocProvider.of<moviecubit>(context).sc!.scm![index].poster_path!,BlocProvider.of<moviecubit>(context).sc!.scm![index].overview!));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              height: 25.h,
                              '${'https://image.tmdb.org/t/p/w500'}${BlocProvider.of<moviecubit>(context).sc!.scm![index].poster_path}',
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(

                                  'assets/No-Image-Placeholder.svg.png',
                                  height: 25.h,

                                );
                              },
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Container(
                                  height: 4.h,
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.all(Radius.circular(10))),
                                  child: Center(
                                    child: Text(
                                      'Premium',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),

                                Container(
                                  width: 40.w,
                                  child: Text(
                                    BlocProvider.of<moviecubit>(context).sc!.scm![index].original_title!,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,


                                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.calendar_month_sharp,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    Text(
                                      BlocProvider.of<moviecubit>(context).sc!.scm![index].release_date!,
                                      style:
                                      TextStyle(fontSize: 12.sp, color: Colors.white),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.access_time,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    Text(
                                      '148 Minutes',
                                      style:
                                      TextStyle(fontSize: 12.sp, color: Colors.white),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.movie,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    Text(
                                      'Action',
                                      style:
                                      TextStyle(fontSize: 12.sp, color: Colors.white),
                                    ),
                                  ],
                                ),


                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              else if(state is sceror)
              {
              return  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Center(child: Image(image: AssetImage('assets/searcheror.png'))),
                    SizedBox(height: 2.h,),
                    Text('we are sorry, we can \n not find the movie :(',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white
                      ),
                    ),
                    SizedBox(height: 2.h,),
                      Text('Find your movie by Type title, \n       categories, years, etc ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15
                        ),
                      )
                  ],
                );
                
              }
              else
                return Text('fff');


            },
          ),
        );
      },





    ) ;


  }
}
