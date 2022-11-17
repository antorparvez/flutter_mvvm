import 'package:flutter/material.dart';
import 'package:flutter_mvvm/res/colors.dart';
import '../view_model/service/splash_service.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    splashServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorPrimary,
      body: Center(
        child: Text(
          'Splash screen',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
