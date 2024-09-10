import 'package:flutter/material.dart';
import 'package:thimar/views/main/widgets/custom_app_bar.dart';

import '../../../../main/widgets/body_faqs.dart';

class FAQSView extends StatefulWidget {
  const FAQSView({super.key});

  @override
  State<FAQSView> createState() => _FAQSViewState();
}

class _FAQSViewState extends State<FAQSView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
    appBar: CustomAppBar(text: "أسئلة متكررة" ),
    body:
    SafeArea(
    child:Padding(
      padding: EdgeInsets.all(8.0),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BodyFaqs(),
        ],),
    )
    ),
    );
    }
}
