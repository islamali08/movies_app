import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviapp/modules/login_screen.dart';
import 'package:moviapp/modules/search_screen.dart';
import 'package:moviapp/modules/siting_screen.dart';
import 'package:moviapp/share/componont/componants.dart';
import 'package:moviapp/share/network/local/shared_pref.dart';
import 'package:sizer/sizer.dart';

import '../share/network/network/cupit/movie_cubit.dart';
import 'first_screen.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int selectindex = 0;

  List<Widget> screens = [
    firstscreen(),
    searchScreen(),
    Center(
        child: Text(
      'screenthree',
      style: TextStyle(color: Colors.white),
    )),
    sitingScreen()
  ];

  void chiceScreen(int index) {
    setState(() {
      selectindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(selectindex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectindex,
        unselectedItemColor: Colors.grey,
        backgroundColor: Color(0xff1F1D2B),
        type: BottomNavigationBarType.fixed,
        onTap: chiceScreen,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(
              height: 33,
              width: 80,
              decoration: BoxDecoration(
                  color:
                      selectindex == 0 ? Color(0xff252836) : Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.home),
                  SizedBox(
                    width: 2,
                  ),
                  selectindex == 0
                      ? Text(
                          'home',
                          style: TextStyle(
                              color: selectindex == 0
                                  ? Colors.lightBlue
                                  : Colors.grey),
                        )
                      : Container()
                ],
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 33,
              width: 80,
              decoration: BoxDecoration(
                  color:
                      selectindex == 1 ? Color(0xff252836) : Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.search),
                  SizedBox(
                    width: 2,
                  ),
                  selectindex == 1
                      ? Text(
                          'search',
                          style: TextStyle(
                              color: selectindex == 1
                                  ? Colors.lightBlue
                                  : Colors.grey),
                        )
                      : Container()
                ],
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 5.h,
              width: 20.w,
              decoration: BoxDecoration(
                  color:
                      selectindex == 2 ? Color(0xff252836) : Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.download),
                  SizedBox(
                    width: 3,
                  ),
                  selectindex == 2
                      ? Text(
                          'save',
                          style: TextStyle(
                              color: selectindex == 2
                                  ? Colors.lightBlue
                                  : Colors.grey),
                        )
                      : Container()
                ],
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 33,
              width: 80,
              decoration: BoxDecoration(
                  color:
                      selectindex == 3 ? Color(0xff252836) : Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.person),
                  SizedBox(
                    width: 3,
                  ),
                  selectindex == 3
                      ? Text(
                          'acount',
                          style: TextStyle(
                              color: selectindex == 3
                                  ? Colors.lightBlue
                                  : Colors.grey),
                        )
                      : Container()
                ],
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
