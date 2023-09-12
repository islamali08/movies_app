import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviapp/modules/searchresult.dart';
import 'package:moviapp/share/network/local/shared_pref.dart';
import 'package:moviapp/share/network/network/cupit/move_state.dart';
import 'package:sizer/sizer.dart';

import '../share/componont/componants.dart';
import '../share/network/network/cupit/movie_cubit.dart';

class searchScreen extends StatefulWidget {
  @override
  State<searchScreen> createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 7.h, left: 4.w, right: 5.w),
        child: BlocConsumer<moviecubit, moviesstate>(
          listener: (context, state) {},
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customtextform(
                        hinttext: 'Type title, categories, years, etc',
                        control: BlocProvider.of<moviecubit>(context).search,
                        prefx: IconButton(
                            onPressed: () {
                              setState(() {});
                              BlocProvider.of<moviecubit>(context)
                                  .getsercscreen(
                                      BlocProvider.of<moviecubit>(context)
                                          .search
                                          .text);
                              setState(() {
                                cashhelper.savedata(
                                    key: 'imge',
                                    value: BlocProvider.of<moviecubit>(context)
                                        .sc!
                                        .scm![0]
                                        .original_title);
                              });
                              BlocProvider.of<moviecubit>(context).cashin();

                              setState(() {
                                BlocProvider.of<moviecubit>(context).image =
                                    cashhelper.getdata(key: 'imge');
                                BlocProvider.of<moviecubit>(context).title =
                                    cashhelper.getdata(key: 'title');
                                BlocProvider.of<moviecubit>(context).date =
                                    cashhelper.getdata(key: 'date');
                              });

                              navigate(context, searchresult());
                            },
                            icon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ))),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      'Today',
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          height: 25.h,
                          '${'https://image.tmdb.org/t/p/w500'}${cashhelper.getdata(key: 'imge')}',
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
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
                                cashhelper.getdata(
                                  key: 'title',
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_month_sharp,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                Text(
                                  cashhelper.getdata(
                                    key: 'date',
                                  ),
                                  style: TextStyle(
                                      fontSize: 12.sp, color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                Text(
                                  '148 Minutes',
                                  style: TextStyle(
                                      fontSize: 12.sp, color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
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
                                      fontSize: 12.sp, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Spacer(),
                    Text(
                      'Recommend for you',
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      height: 30.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: BlocProvider.of<moviecubit>(context)
                            .sc!
                            .scm!
                            .length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: Container(
                                width: 40.w,
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      child: Container(
                                        child: Image.network(
                                          '${'https://image.tmdb.org/t/p/w500'}${BlocProvider.of<moviecubit>(context).sc!.scm![index].poster_path}',
                                          fit: BoxFit.fill,
                                          height: 22.h,
                                          width: double.infinity,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.asset(
                                              fit: BoxFit.fill,
                                              'assets/No-Image-Placeholder.svg.png',
                                              height: 22.h,
                                            );
                                          },
                                        ),
                                      ),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20)),
                                    ),
                                    Spacer(),
                                    Text(
                                      BlocProvider.of<moviecubit>(context)
                                              .sc!
                                              .scm![index]
                                              .original_title ??
                                          BlocProvider.of<moviecubit>(context)
                                              .sc!
                                              .scm![index]
                                              .overview!,
                                      maxLines: 1,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17),
                                    ),
                                    Text(
                                      BlocProvider.of<moviecubit>(context)
                                          .sc!
                                          .scm![index]
                                          .overview!,
                                      maxLines: 1,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 17),
                                    )
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xff252836),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.sp)),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
