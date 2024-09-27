import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:thimar/core/logic/cache_helper.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import 'package:thimar/views/auth/presentation/login/view.dart';
import 'package:thimar/views/main/cart/view.dart';
import 'constans.dart';
import 'core/get_it/get_it.dart';
import 'core/logic/helper_method.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  initGetIt();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();
  CachHelper.init();
  DioHelper.interceptors();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      // <-- change the path of the translation files
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('ar'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (context, child) => MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        title: 'thimar',
        navigatorKey: navigatorKey,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: kTextFamily,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromHeight(55.h),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  backgroundColor: kPrimaryColor,
                  maximumSize: MediaQuery.of(context).size,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(16.r)))),

          // primarySwatch:MaterialColor(int,),
          colorScheme: ColorScheme.fromSeed(
              seedColor: kPrimaryColor, primary: kPrimaryColor),
          inputDecorationTheme: InputDecorationTheme(
              alignLabelWithHint: true,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(22.r)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22.r),
                  borderSide: const BorderSide(color: Color(0xffF3F3F3)))),
        ),
        home: child,
      ),

      child: const LoginView(),
    );
  }
}

//
