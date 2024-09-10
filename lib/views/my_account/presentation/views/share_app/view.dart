import 'package:flutter/material.dart';
import 'package:thimar/views/main/widgets/custom_app_bar.dart';
class ShareAppView extends StatelessWidget {
  const ShareAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar: CustomAppBar(text: 'مشاركه التطبيق',),
      body: Column(
        children: [



      ],),
    );
  }
}
