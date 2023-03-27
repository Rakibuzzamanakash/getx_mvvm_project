
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:getx_mvvm_project/data/app_exceptions.dart';
import 'package:getx_mvvm_project/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {


  @override
  Future getApi(String url) async{
    if(kDebugMode){
      print(url);
    }

    dynamic responseJson;

    try{
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      throw InternetException('');
    }on RequestTimeOut{
      throw RequestTimeOut('');
    }
    return responseJson;
  }
  @override
  Future postApi(var data ,String url) async{
    if(kDebugMode){
      print(url);
      print(data);
    }

    dynamic responseJson;

    try{
      final response = await http.post(Uri.parse(url),
      //body: jsonEncode(data),
      body: data,
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      throw InternetException('');
    }on RequestTimeOut{
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }



  dynamic returnResponse(http.Response response){
     switch(response.statusCode){
       case 200:
         dynamic responseJson = jsonDecode(response.body);
         return responseJson;
       case 400:
         // dynamic responseJson = jsonDecode(response.body);
         // return responseJson;
         throw InternetException ;
       default :
         throw FetchDataException('Error accoured while communication with server${response.statusCode}');
     }
  }

}