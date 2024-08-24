import'package:docdoc/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:docdoc/features/onbording/onbprding_screen.dart';
import 'package:docdoc/features/login/login_screen.dart';
class AppRouter{
  Route generateRoute(RouteSettings settings){
    //this argument is used to be passed in any screen like this(argument as class name)
    final arguments = settings.arguments;
    switch(settings.name){
      case Routes.onBoardingScreen:
      return MaterialPageRoute(
        builder: (context) =>const OnBoardingScreen());
        case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) =>const LoginScreen());
        default:
        return MaterialPageRoute(
          builder: (_)=>Scaffold(
            body: Center(child: Text("no route defined for${settings.name}")),
            ));

    }

  }
}