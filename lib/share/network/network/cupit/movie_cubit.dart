
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviapp/model/comedy_model.dart';
import 'package:moviapp/model/relate_model.dart';
import 'package:moviapp/share/componont/constant.dart';
import 'package:moviapp/share/network/local/shared_pref.dart';
import 'package:moviapp/share/network/network/cupit/dio_helper.dart';
import '../../../../model/all_model.dart';
import '../../../../model/popular_model.dart';
import '../../../../model/search_model.dart';
import '../../../../model/search_screen_model.dart';
import '../../../../modules/home.dart';
import '../../../componont/componants.dart';
import 'move_state.dart';
import 'package:dio/dio.dart';


class moviecubit extends Cubit<moviesstate>{
  moviecubit(): super(initialstate());

  userlistmodel? movie ;
  String? erore ;
   void getpopular(){
     print('hi');
     emit(lodingstate());
     diohelper.getdata(url: popularendpoimt).then((value) {
       movie = userlistmodel.fromjeson(value.data);
       print(movie!.film![0].poster_path);
emit(susesstate());

     }).catchError((onError){
       erore = onError.toString() ;
       print(onError.toString());
       emit(eror());

     });
     
     
   }

  alllistmodel? allmov ;
  void getall(){
    print('hi');
    emit(alllodingstate());
    diohelper.getdata(url: all).then((value) {
      allmov = alllistmodel.fromjeson(value.data);
      print(allmov!.all![0].poster_path);
      emit(allsusesstate());

    }).catchError((onError){
      erore = onError.toString() ;
      print(onError.toString());
      emit(alleror());

    });


  }



  usersearchlistmodel? ser ;
  void getserchrelate(String nam){
    print('hi');
    emit(lodingsearchstate());
    diohelper.getdata(url: searchmov,
    qure: {'query':nam,

    }

    ).then((value) {
      ser = usersearchlistmodel.fromjeson(value.data);
      print(ser!.searc![0].original_title);
      emit(searchesusesstate());

    }).catchError((onError){
      print(onError.toString());
      emit(sercheror());

    });


  }



  comedylistmodel? com ;
  void comedymovies(){
    print('hi');
    emit(comedylodingstate());
    diohelper.getdata(url: searchcolection,
        qure: {'query':'action',

        }

    ).then((value) {
      com = comedylistmodel.fromjeson(value.data);
      print(value.data);
      print(com!.comedy![0].poster_path);
      emit(comedysusesstate());

    }).catchError((onError){
      print(onError.toString());
      emit(comedyeror());

    });


  }


  userrelatemodel? relate ;
  void getrelate(){
    print('hi');
    emit(relatelodingstate());
    diohelper.getdata(url: toprate).then((value) {
      relate = userrelatemodel.fromjeson(value.data);
      print(relate!.film![0].original_title);
      emit(relatesusesstate());

    }).catchError((onError){
      print(onError.toString());
      emit(relateeror());

    });


  }



  bool ischec =false ;
void checbox (bool value){
  ischec = value ;
  emit(chec());

}

bool log = false ;
  void islog(){
    final   user = FirebaseAuth.instance.currentUser ;

    if(user!=null) {
log =true     ;

emit(isloge());
    }
  }
  Future Siginin (email,password,name) async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value)
    {
     if(value!=null){
cashhelper.savedata(key: 'islog', value: true)       ;
cashhelper.savedata(key: 'email', value: value.user!.email)       ;
cashhelper.savedata(key: 'name', value: name)       ;
     }
     log= cashhelper.getdata(key: 'islog');

     print(log);
      emit(isloge());

    }

    );
    emit(siginin());
  }


bool tec = false ;

  void chanetec(){

    tec =!tec ;

    emit(tecstate());
  }
TextEditingController search = TextEditingController();
  searchscreenmodel? sc ;
  void getsercscreen(String name){
    print('hi');
    emit(sclodingstate());
    diohelper.getdata(url: searchmov,
        qure: {'query':name,

        }

    ).then((value) {
      sc = searchscreenmodel.fromjeson(value.data);
      print(sc!.scm![0].original_title);
      cashhelper.savedata(key: 'imge', value: sc!.scm![0].poster_path);
      cashhelper.savedata(key: 'title', value:sc!.scm![0].original_title);
      cashhelper.savedata(key: 'date', value: sc!.scm![0].release_date);

      print("{${cashhelper.getdata(key: 'title')}}iiiiiiiiiiiiiiiiiiiiiii");

      emit(scsusesstate());

    }).catchError((onError){
      print(onError.toString());
      emit(sceror(onError.toString()));

    });


  }

void cashin(){
  cashhelper.savedata(key: 'imge', value: sc!.scm![0].poster_path);
  cashhelper.savedata(key: 'title', value:sc!.scm![0].original_title);
  cashhelper.savedata(key: 'date', value: sc!.scm![0].release_date);

  print("{${cashhelper.getdata(key: 'title')}}iiiiiiiiiiiiiiiiiiiiiii");
  emit(cashstate());

}

String? image ;
String? title ;
String? date ;
void cashout(){
  image=  cashhelper.getdata(key: 'imge');
  title=  cashhelper.getdata(key: 'title');
  date=  cashhelper.getdata(key: 'date');
  emit(cashoutstate());
}


}