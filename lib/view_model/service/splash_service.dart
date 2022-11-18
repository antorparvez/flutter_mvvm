import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_mvvm/view/home_view.dart';
import 'package:flutter_mvvm/view/login_view.dart';

import '../../model/user_model.dart';
import '../chache_user_view_model.dart';

class SplashServices {
  Future<UserModel> getUserDate() => UserViewModel().getLocalCacheUser();

  void checkAuthentication(BuildContext context) async {
    getUserDate().then((value) async {
      print(value.token.toString() + " this is a token");

      if (value.token.toString() == 'null' || value.token.toString() == '') {
        await Future.delayed(Duration(seconds: 1));
        Navigator.pushReplacementNamed(context, RoutesName.login);
        /*Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginView(),
            ));*/
      } else {
        await Future.delayed(Duration(microseconds: 55));
        // Navigator.pushNamed(context, RoutesName.home);
        Navigator.pushReplacementNamed(context, RoutesName.home);
        /*Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeView(),
            ));*/
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
