import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm/repository/auth_repository.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_mvvm/utils/utils.dart';
import 'package:flutter_mvvm/view_model/chache_user_view_model.dart';
import 'package:provider/provider.dart';

import '../model/user_model.dart';

class AuthViewViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic body, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(body).then((value) {
      setLoading(false);
      final userPreference = Provider.of<UserViewModel>(context, listen: false);
      userPreference.saveToCache(
          UserModel(token: value['token'].toString(), id: value['id']));

      Utils.toastMessage("Login successful");
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.toastMessage(error.toString());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> signUpApi(dynamic body, BuildContext context) async {
    setLoading(true);
    _myRepo.registrationApi(body).then((value) {
      setLoading(false);
      final userPreference = Provider.of<UserViewModel>(context, listen: false);
      userPreference.saveToCache(
          UserModel(token: value['token'].toString(), id: value['id']));
      Utils.toastMessage("Registration successful");
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.toastMessage(error.toString());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
