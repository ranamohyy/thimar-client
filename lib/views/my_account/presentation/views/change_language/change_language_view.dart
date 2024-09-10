import 'package:flutter/material.dart';
import 'package:thimar/views/main/widgets/custom_app_bar.dart';
import 'package:thimar/views/my_account/presentation/views/my_profile/view.dart';

class ChangeLanguageView extends StatelessWidget {
  const ChangeLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      appBar:  CustomAppBar(text: 'تغيير اللغة',),
  body: Column(
    children: [


    ],
  ),

    );
  }
}
