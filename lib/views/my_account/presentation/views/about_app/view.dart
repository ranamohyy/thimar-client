import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';import 'package:get_it/get_it.dart';
import 'package:thimar/core/design/app_image.dart';
import 'package:thimar/core/design/app_loading.dart';
import 'package:thimar/views/my_account/data/about_app_bloc/about_app_bloc.dart';
import '../../../../../core/app_failure/custom_error_widget.dart';
import '../../../../main/widgets/custom_app_bar.dart';
class AboutAppView extends StatefulWidget {
  const AboutAppView({super.key});
  @override
  State<AboutAppView> createState() => _BodyAboutAppViewState();
}
class _BodyAboutAppViewState extends State<AboutAppView> {
  final bloc = GetIt.I<AboutAppBloc>()..add(AboutAppEvent());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body:
        SafeArea(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        CustomAppBar(
          text: "aboutApp".tr(),
        ),
         const SizedBox(height: 12,),
          BlocBuilder(
            bloc: bloc,
            builder: (context, state) {
              if(state is AboutAppLoadingState){
                       return const AppLoadingView();

    }

              else if (state is AboutAppSuccessState)
    {
                          return  Column(
                            children: [
                             const Center(child: AppImage(url:"logo.png",height: 200,width: 200,)),
                             const SizedBox(height: 8,),
                              HtmlWidget(state.list.data.about,)

                          ],);
                 }else if (state is AboutAppFailedState){
               return CustomErrorWidget(errMessage: state.errMessege);
    }
                 return const SizedBox();
  }


  ),




        ],

        ),
        ),



        );
      }
}

