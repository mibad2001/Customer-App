import 'dart:convert';

import 'package:dio/dio.dart';

class apiServies{
  final dio = Dio(BaseOptions(
    baseUrl: "",
    headers: { "Content-type": "application/json"}
  ));



  Future<Response> postData(String endPoint , Map<String,dynamic> data) async{
    try {
      final response = await dio.post(endPoint, data: data);
      return response;
    }
    catch(e){
      rethrow;
    }
  }



}