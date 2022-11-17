import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../model/user_model.dart';
import '../../utils/routes/routes_name.dart';
import '../chache_user_view_model.dart';

class SplashServices {
  Future<UserModel> getUserDate() => UserViewModel().getLocalCacheUser();

  void checkAuthentication(BuildContext context) async {
    getUserDate().then((value) async {
      print(value.token.toString() +" this is a token");

      if (value.token.toString() == 'null' || value.token.toString() == '') {
        await Future.delayed(Duration(seconds: 1));
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        await Future.delayed(Duration(seconds: 1));
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
