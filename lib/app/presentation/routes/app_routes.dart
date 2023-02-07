import 'package:flutter/material.dart';
import 'package:stream/app/presentation/modules/home/views/home_views.dart';
import 'package:stream/app/presentation/modules/sign_in/views/sign_in_views.dart';
import 'package:stream/app/presentation/modules/splash/views/splash_view.dart';
import 'package:stream/app/presentation/routes/routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.splash: (context) => const SplashView(),
    Routes.signIn: (context) => const SignInViews(),
    Routes.home: (context) => const HomeViews(),
  };
}
