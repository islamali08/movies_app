import 'package:dio/dio.dart';

import '../../../componont/constant.dart';
import 'package:dio/dio.dart';


class diohelper {
  static Dio? dio;

  static init() {
    dio = Dio(
        BaseOptions(
          baseUrl: 'https://api.themoviedb.org/3/',

          receiveDataWhenStatusError: true,
          queryParameters:{'api_key':apikey

          },




        )
    );
  }


  static Future<Response> getdata({
    required String url,
    Map<String,dynamic>? qure



  }) async {
    return await dio!.get(
      url,
      queryParameters: qure


    );
  }

}