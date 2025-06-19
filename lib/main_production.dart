import 'package:docdoc/core/di/dependency_injection.dart';
import 'package:docdoc/core/helper/constants.dart';
import 'package:docdoc/core/helper/extensions.dart';
import 'package:docdoc/core/helper/shared_preference.dart';
import 'package:docdoc/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'doc_app.dart';


void main() async {
WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  // to fix texts beinh hideen in flutter screen util in release mode
  await checkedIfLoggedInUser();
  await ScreenUtil.ensureScreenSize();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}

Future checkedIfLoggedInUser() async {
  String? userToken = await SharedPrefHelper.getSecuredStorage(ConstantsPrfKeys.userToken);
  if (!userToken.isNullOrEmpty() ) {
    isLoggedIn = true;
    } else {
    isLoggedIn = false;
  }
}