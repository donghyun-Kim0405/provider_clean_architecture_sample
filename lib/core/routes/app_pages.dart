import 'package:flutter/cupertino.dart';
import 'package:provider_clean_architecture/core/routes/app_routes_name.dart';
import 'package:provider_clean_architecture/presentation/routes/home/home_routes.dart';
import 'package:provider_clean_architecture/presentation/routes/onboarding/login_routes.dart';
import 'package:provider_clean_architecture/presentation/routes/onboarding/splash_routes.dart';

/// 화면에 보여질 페이지들 생성을 위해 app초기 initialize시점에 전달해야함
Map<String, WidgetBuilder> appRoutes = {
  AppRoutesName.SPLASH: (context) => SplashRoutes(),
  AppRoutesName.LOGIN: (context) => LoginRoutes(),
  AppRoutesName.HOME: (context) => HomeRoutes(),

};