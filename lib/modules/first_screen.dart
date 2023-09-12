import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviapp/model/search_model.dart';
import 'package:moviapp/share/network/local/shared_pref.dart';
import 'package:moviapp/share/network/network/cupit/move_state.dart';
import 'package:sizer/sizer.dart';

import '../share/componont/componants.dart';
import '../share/network/network/cupit/movie_cubit.dart';

class firstscreen extends StatefulWidget {
  @override
  State<firstscreen> createState() => _firstscreenState();
}

class _firstscreenState extends State<firstscreen> {
  int selectindex = 0;

  List<String> catag = ['All', 'Action', 'Animation', 'comedy'];
  TextEditingController search = TextEditingController();

  void chiceScreen(int index) {
    setState(() {
      selectindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<moviecubit, moviesstate>(
          listener: (BuildContext context, Object? state) {},
          builder: (BuildContext context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 5.w),
              child: Center(
                child: Column(
                  children: [
                    Row(
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
                          children: [
                            Text(
                              'Hi, ${cashhelper.getdata(key: 'name')}',
                              style: TextStyle(
                                  fontSize: 13.sp, color: Colors.white),
                            ),
                            Text(
                              'Let’s stream your favorite movie',
                              style: TextStyle(
                                  fontSize: 13.sp, color: Colors.grey),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    customtextform(
                        hinttext: '  search',
                        control: search,
                        sufix: BlocProvider.of<moviecubit>(context).tec == false
                            ? IconButton(
                                color: Colors.white,
                                onPressed: () {
                                  BlocProvider.of<moviecubit>(context)
                                      .getserchrelate(search.text);
                                  BlocProvider.of<moviecubit>(context)
                                      .chanetec();
                                },
                                icon: Icon(Icons.search),
                              )
                            : IconButton(
                                color: Colors.white,
                                onPressed: () {
                                  BlocProvider.of<moviecubit>(context)
                                      .chanetec();
                                  search.clear();
                                },
                                icon: Icon(Icons.arrow_back),
                              )),
                    SizedBox(
                      height: 4.h,
                    ),
                    Container(
                        height: 25.h,
                        child: BlocProvider.of<moviecubit>(context).tec == false
                            ? ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Container(
                                      height: 30.h,
                                      width: 90.w,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                23.sp)), // Image border
                                        child: SizedBox.fromSize(
                                          size: Size.fromRadius(
                                              50), // Image radius
                                          child: Stack(
                                            children: [
                                              Align(
                                                child: Image.network(
                                                    '${'https://image.tmdb.org/t/p/w500'}${BlocProvider.of<moviecubit>(context).movie!.film![index].backdrop_path}',
                                                    errorBuilder: (context, error, stackTrace) {

                                                      return Image.asset('assets/No-Image-Placeholder.svg.png');
                                                    },
                                                    fit: BoxFit.fill),
                                                alignment: Alignment.center,
                                              ),
                                              Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    '  ${BlocProvider.of<moviecubit>(context).relate!.film![index].original_title}',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 25),
                                                  )),
                                              Align(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Text(
                                                    '  ${BlocProvider.of<moviecubit>(context).relate!.film![index].release_date}',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 25),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                            : Padding(
                                padding: const EdgeInsets.all(5),
                                child: BlocBuilder<moviecubit, moviesstate>(

                                    builder: (context, state) {
                                  if (state is lodingsearchstate)
                                    return CircularProgressIndicator();
                                  else if (state is searchesusesstate) {

                                    cashhelper.savedata(key: 'imge', value: BlocProvider.of<moviecubit>(context).ser!.searc![0].poster_path);
                                    cashhelper.savedata(key: 'title', value: BlocProvider.of<moviecubit>(context).ser!.searc![0].original_title);
                                    cashhelper.savedata(key: 'date', value: BlocProvider.of<moviecubit>(context).ser!.searc![0].release_date);
                                            BlocProvider.of<moviecubit>(context).image = cashhelper.getdata(key: 'imge');
                                            BlocProvider.of<moviecubit>(context).title = cashhelper.getdata(key: 'title');
                                            BlocProvider.of<moviecubit>(context).date = cashhelper.getdata(key: 'date');

                                    return Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Container(
                                        height: 30.h,
                                        width: 90.w,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(23.sp)),
                                          // Image border
                                          child: SizedBox.fromSize(
                                            size: Size.fromRadius(50),
                                            // Image radius
                                            child: Stack(
                                              children: [
                                                Align(
                                                  child: Image.network(
                                                      '${'https://image.tmdb.org/t/p/w500'}${BlocProvider.of<moviecubit>(context).ser!.searc![0].backdrop_path}',
                                                      fit: BoxFit.cover),
                                                  alignment: Alignment.center,
                                                ),
                                                Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      '${BlocProvider.of<moviecubit>(context).ser!.searc![0].original_title}',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 25),
                                                    )),
                                                Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Text(
                                                      '${BlocProvider.of<moviecubit>(context).ser!.searc![0].release_date}',
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 25),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  } else if (state is sercheror)
                                    return Text('eror');
                                  else
                                    return Container();
                                }))),
                    SizedBox(
                      height: 4.h,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Categories',
                        style: TextStyle(color: Colors.grey, fontSize: 25),
                      ),
                    ),
                    Container(
                      height: 7.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: catag.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              chiceScreen(index);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 5.h,
                                width: 20.w,
                                child: Center(
                                    child: Text(
                                  catag[index],
                                  style: TextStyle(color: Colors.white),
                                )),
                                decoration: BoxDecoration(
                                  color: selectindex == index
                                      ? Color(0xff252836)
                                      : Colors.transparent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.sp)),
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
                    selectindex == 0
                        ? Container(
                            height: 35.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: BlocProvider.of<moviecubit>(context)
                                  .allmov!
                                  .all!
                                  .length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    chiceScreen(index);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                      width: 40.w,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            child: Container(
                                              child: Image.network(
                                                '${'https://image.tmdb.org/t/p/w500'}${BlocProvider.of<moviecubit>(context).allmov!.all![index].poster_path}',
                                                fit: BoxFit.fill,
                                                height: 27.h,
                                                width: double.infinity,
                                                errorBuilder: (context, error, stackTrace) {
                                                  return Image.asset('assets/No-Image-Placeholder.svg.png');
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
                                                    .allmov!
                                                    .all![index]
                                                    .original_title ??
                                                BlocProvider.of<moviecubit>(
                                                        context)
                                                    .allmov!
                                                    .all![index]
                                                    .original_name!,
                                            maxLines: 1,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17),
                                          ),
                                          Text(
                                            BlocProvider.of<moviecubit>(context)
                                                .allmov!
                                                .all![index]
                                                .media_type!,
                                            maxLines: 1,
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 17),
                                          )
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xff252836),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.sp)),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : Container(
                            height: 35.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: BlocProvider.of<moviecubit>(context)
                                  .com!
                                  .comedy!
                                  .length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    chiceScreen(index);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                      width: 40.w,
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            child: Container(
                                              child: Image.network(
                                                '${'https://image.tmdb.org/t/p/w500'}${BlocProvider.of<moviecubit>(context).com!.comedy![index].poster_path}',
                                                fit: BoxFit.fill,
                                                height: 27.h,
                                                width: double.infinity,
                                                errorBuilder: (context, error, stackTrace) {
                                                  
                                                  return Image.asset('assets/No-Image-Placeholder.svg.png',
                                                    height: 27.h,

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
                                                    .com!
                                                    .comedy![index]
                                                    .name ??
                                                BlocProvider.of<moviecubit>(
                                                        context)
                                                    .com!
                                                    .comedy![index]
                                                    .overview!,
                                            maxLines: 1,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17),
                                          ),
                                          Text(
                                            BlocProvider.of<moviecubit>(context)
                                                .com!
                                                .comedy![index]
                                                .overview!,
                                            maxLines: 1,
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 17),
                                          )
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xff252836),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.sp)),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
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
