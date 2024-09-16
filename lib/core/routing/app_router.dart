import 'package:docdoc/core/di/dependency_injection.dart';
import'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/features/home/ui/home_screen.dart';
import 'package:docdoc/features/login/logic/login_cubit.dart';
import 'package:docdoc/features/signup/logic/register_cubit.dart';
import 'package:docdoc/features/signup/ui/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:docdoc/features/onbording/onbprding_screen.dart';
import 'package:docdoc/features/login/ui/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AppRouter{
  Route generateRoute(RouteSettings settings){
    //this argument is used to be passed in any screen like this(argument as class name)
    final arguments = settings.arguments;
    switch(settings.name){
      case Routes.onBoardingScreen:
      return MaterialPageRoute(
        builder: (context) =>const OnBoardingScreen());
        
      case Routes.homeScreen:
      return MaterialPageRoute(
        builder: (context) =>const HomeScreen());
      
        case Routes.loginScreen:
        return MaterialPageRoute( 
          builder: (_)=> BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ));
      case Routes.signUpScreen:
      return MaterialPageRoute(
        builder: (_)=>BlocProvider(create: (context) => getIt<RegisterCubit>(),
        child: const SignupScreen(),
        )
      );
        default:
        return MaterialPageRoute(
          builder: (_)=>Scaffold(
            body: Center(child: Text("no route defined for${settings.name}")),
            ));

    }

  }
}