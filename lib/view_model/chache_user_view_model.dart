import 'package:flutter/widgets.dart';
import 'package:flutter_mvvm/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveToCache(UserModel user) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString("token", user.token.toString());
   // sharedPreferences.setInt("id", user.id);
    notifyListeners();
    return true;
  }

  Future<UserModel> getLocalCacheUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');

    return UserModel(
        token: token.toString()
    );
  }


  Future<bool> removeUserCache() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.clear();
  }
}
