import 'package:flutter/material.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_mvvm/view_model/chache_user_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final userPref = Provider.of<UserViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        child: InkWell(
            onTap: () {
              userPref.removeUserCache().then((value) {
                Navigator.pushNamed(context, RoutesName.login);
              });
            },
            child: Center(
              child: Text("logout"),
            )),
      ),
    );
  }
}
