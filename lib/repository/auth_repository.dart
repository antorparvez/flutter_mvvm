import 'package:flutter_mvvm/data/network/base_api_services.dart';
import 'package:flutter_mvvm/data/network/network_api_services.dart';
import 'package:flutter_mvvm/res/app_url.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic body) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginApi, body);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> registrationApi(dynamic body) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.registrationApi, body);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
