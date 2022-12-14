import 'package:flutter/material.dart';
import 'package:flutter_mvvm/utils/routes/routes.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_mvvm/view_model/auth_view_model.dart';
import 'package:flutter_mvvm/view_model/chache_user_view_model.dart';
import 'package:provider/provider.dart';

import 'res/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => AuthViewViewModel()),
      ChangeNotifierProvider(create: (_) => UserViewModel()),
    ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: AppColors.generateMaterialColorFromColor(
              AppColors.colorPrimary),
        ),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ));
  }
}
