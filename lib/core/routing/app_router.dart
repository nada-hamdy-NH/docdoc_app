import 'package:docdoc/core/di/dependency_injection.dart';
import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/features/doctors/logic/doctors_cubit.dart';
import 'package:docdoc/features/doctors/ui/doctor_details.dart';
import 'package:docdoc/features/doctors/ui/filter_doctors.dart';
import 'package:docdoc/features/home/data/spesialization_response_model.dart';
import 'package:docdoc/features/home/ui/logic/home_cubit.dart';
import 'package:docdoc/features/home/ui/home/home.dart';
import 'package:docdoc/features/inbox/data/model/message_item_model.dart';
import 'package:docdoc/features/inbox/presentaion/ui/view/conversation_view.dart';
import 'package:docdoc/features/login/logic/login_cubit.dart';
import 'package:docdoc/features/login/ui/forget_password.dart';
import 'package:docdoc/features/notification/ui/notification_screen.dart';
import 'package:docdoc/features/payment/data/payment_intent_response_model/make_appointment_model.dart';
import 'package:docdoc/features/payment/presentation/logic/cubit/make_appointment_cubit.dart';
import 'package:docdoc/features/payment/presentation/ui/confirmed_screen.dart';
import 'package:docdoc/features/profile/presentaion/logic/cubit/profile_cubit.dart';
import 'package:docdoc/features/profile/presentaion/ui/settings.dart';
import 'package:docdoc/features/signup/logic/register_cubit.dart';
import 'package:docdoc/features/signup/ui/signup_screen.dart';
import 'package:docdoc/features/speciality/ui/specility_screen.dart';
import 'package:flutter/material.dart';
import 'package:docdoc/features/onbording/onbprding_screen.dart';
import 'package:docdoc/features/login/ui/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this argument is used to be passed in any screen like this(argument as class name)
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());

      case Routes.home:
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: getIt<HomeCubit>(),
                  child: const Home(),
                ));

      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: const LoginScreen(),
                ));
      case Routes.signUpScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<RegisterCubit>(),
                  child: const SignupScreen(),
                ));

      case Routes.notificationScreen:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
         case Routes.forgetPassword:
        return MaterialPageRoute(builder: (_) =>  ForgotPasswordView());

      case Routes.specialityScreen:
        final specializationDataList =
            settings.arguments as List<SpecializationData>;
        return MaterialPageRoute(
            builder: (_) => SpecilityScreen(
                specializationDataList: specializationDataList));

      case Routes.doctorScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => DoctorsCubit(getIt())..getDoctors(),
                child: const FilterDoctorsScreen()));

      case Routes.ConfirmedScreen:
        final args = settings.arguments as MakeAppointmentModel;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => MakeAppointmentCubit(),
                  child: ConfirmedScreen(appientmentModel: args),
                ));

      case Routes.conversationView:
        final arguments = settings.arguments as MessageItemModel;
        return MaterialPageRoute(
            builder: (_) => ConversationView(messageItemModel: arguments));

      case Routes.doctorDetailsScreen:
        final args = arguments as List;
        final id = args[0] as String;
        final image = args[1] as String;

        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>
                      getIt<DoctorsCubit>()..getDoctor(id.toString()),
                  child: DoctorDetailsScreen(image: image),
                ));

                case Routes.settings:
        
                 return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>
                      getIt<ProfileCubit>(),
                  child: SettingsView(),
                ));

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text("no route defined for${settings.name}")),
                ));
    }
  }
}
