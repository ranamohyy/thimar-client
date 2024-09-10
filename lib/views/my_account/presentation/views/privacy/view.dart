import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get_it/get_it.dart';
import 'package:thimar/constans.dart';
import 'package:thimar/core/design/app_loading.dart';
import 'package:thimar/views/my_account/data/privacy_bloc/privacy_bloc.dart';
import 'package:thimar/views/my_account/presentation/view.dart';

import '../../../../../core/design/app_image.dart';
import '../../../../../core/logic/helper_method.dart';
class PrivacyView extends StatefulWidget {
  const PrivacyView ({super.key});

  @override
  State<PrivacyView> createState() => _PrivacyViewState();
}
final bloc= GetIt.I<PrivacyBloc>()..add(PrivacyEvent());
class _PrivacyViewState extends State<PrivacyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar:AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title:const  Text(
          "سياسة الخصوصية",
          style: kAppBarTextStyle),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            navigateTo((const MyAccountPage()));
          },
          child:const  Stack(
            alignment: Alignment.center,
            children: [
              AppImage(url: "Rectangle .png", height: 40, width: 40),
              AppImage(url: "Arrow_Right .png",
                  height: 15, width: 15, fit: BoxFit.fill),
            ],
          ),
        ),
      ) ,
      body: BlocBuilder<PrivacyBloc,PrivacyStates>(
        bloc: bloc,
        builder:(context, state) {
          if (state is PrivacySuccess) {
            print(state.list.data.policy);
            return
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(children: [
                  const SizedBox(height: 15,),
                  HtmlWidget(state.list.data.policy,

                  ),
                ]),
              );
          }else if(state is PrivacyLoading){
            return const AppLoadingView();
          }
          return const SizedBox();
        } ),
    );
  }
}
