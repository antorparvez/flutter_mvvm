import 'dart:convert';
import 'dart:io';

import 'package:flutter_mvvm/data/app_exceptions.dart';
import 'package:flutter_mvvm/data/network/base_api_services.dart';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices {

  @override
  Future getGetApiResponse(String url) async {

    dynamic responseJson ;
    try {

      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException {

      throw FetchDataExceptions('No Internet Connection');
    }

    return responseJson;

  }


  @override
  Future getPostApiResponse(String url , dynamic data) async{

    dynamic responseJson ;
    try {

      Response response = await post(
          Uri.parse(url),
          body: data
      ).timeout(Duration(seconds: 10));

      responseJson = returnResponse(response);
    }on SocketException {

      throw FetchDataExceptions('No Internet Connection');
    }

    return responseJson ;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw BadRequestExceptions(response.body.toString());

      case 500:
        throw UnauthorisedExceptions(response.body.toString());

      case 404:
        throw BadRequestExceptions(response.body.toString());

      default:
        throw FetchDataExceptions(
            "Error occurs while communicating server with status code: ${response.statusCode.toString()}");
    }
  }
}
