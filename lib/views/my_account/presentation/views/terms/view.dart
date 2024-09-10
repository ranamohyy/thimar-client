import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get_it/get_it.dart';
import 'package:thimar/core/design/app_loading.dart';
import 'package:thimar/views/main/widgets/custom_app_bar.dart';
import 'package:thimar/views/my_account/data/terms%20and%20laws%20bloc/terms_bloc.dart';
class TermsView extends StatefulWidget {
  const TermsView({super.key});

  @override
  State<TermsView> createState() => _TermsViewState();
}
class _TermsViewState extends State<TermsView> {
final bloc= GetIt.I<TermsBloc>()..add(TermsEvent());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar:
      CustomAppBar(text: "terms".tr()),
      body: BlocBuilder<TermsBloc,TermsStates>
        (
        bloc: bloc,
          builder:(context, state)
          {
          if(state is TermsSuccess){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: HtmlWidget(
                state.list.data.terms
              ),
            );
          }
          else if(state is TermsLoading){
            return const AppLoadingView();
          }return const SizedBox();
        }

    ),
    );
  }
}
