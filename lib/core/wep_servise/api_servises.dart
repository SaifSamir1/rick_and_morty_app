




// import 'package:dio/dio.dart';
//
// import '../utils/constanse.dart';
//
// class CharacterServices {
//   final _baseUrl = baseUrl;
//   final Dio _dio;
//
//   CharacterServices(this._dio);
//
//   Future<Map<String, dynamic>> get({required String endPoint}) async {
//     var response = await _dio.get('$_baseUrl$endPoint');
//     return response.data;
//   }
// }



import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../utils/constnts/strings.dart';

class CharacterServices {
  late Dio dio;


  CharacterServices()
  {
    BaseOptions options =BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60), // 60 seconds,
      receiveTimeout: const Duration(seconds: 60),
    );

    dio = Dio(options);
  }

  Future<Map<String,dynamic>> getAllCharacters()async
  {

    try{
      Response response = await dio.get('/character');
      return response.data;
    }catch (error)
    {
      if (kDebugMode) {
        print(error.toString());
      }
      return {};
    }

  }
//ال fun دي انا مش هستخدمها بس هتعلم
// منها ان ازاي انا وبعمل Request ابعت معاها
// متغير يعني بغير ف ال end point اللي هبعتها وبناء
//  عليها هيجيلي رد مختلف وف ال map بتاعة queryParameters اقدر ابعت
//  اكتر من query لل end point دي وهنا author هو اسم ال query وال charName هي المتغير اللي هبعته
  Future<List<dynamic>> getCharacterQuotes(String charName) async {
    try {
      Response response = await dio.get('quote' , queryParameters: {'author' : charName});
      if (kDebugMode) {
        print(response.data.toString());
      }
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return [];
    }
  }
}