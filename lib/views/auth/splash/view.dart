import 'dart:async';

import 'package:flutter/material.dart';
import 'package:thimar/core/design/app_image.dart';

import '../../../core/logic/helper_method.dart';
import '../presentation/login/view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void initState() {
    super.initState();
    Timer(
      const Duration(
      seconds: 3,
    ),(){ navigateTo(const LoginView(),);
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Center(child: AppImage(url: "logo.png", height: 150, width: 150,)),
          AppImage(url: "Icon1.png"),
        ],),
    );
  }
}
//steps to open log in
// 1-convert to stful
// void initstate(){super.initstate}
//Timer (Duration())before build