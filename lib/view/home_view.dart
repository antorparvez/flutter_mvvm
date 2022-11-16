import 'package:flutter/material.dart';
import 'package:flutter_mvvm/utils/utils.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        child: InkWell(
            onTap: () {
              Utils.flushBarErrorMessage("Not Internet",context);
            },
            child: Center(
              child: Text("Home"),
            )),
      ),
    );
  }
}
