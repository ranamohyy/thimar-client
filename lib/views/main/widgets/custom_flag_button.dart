import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

import '../../../constans.dart';
import '../../../core/design/app_loading.dart';
import '../../../core/logic/helper_method.dart';
import '../../my_account/presentation/views/rate_products/view.dart';
import '../data/actionButtonsBloc/action_button_bloc.dart';
class Bottom extends StatefulWidget {
  const  Bottom({super.key, required this.typee, required this.id, required this.status, required this.totalPrice});

  final String typee;
  final int id;
  final String status;
  final String totalPrice;
  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  final cancelOrder = GetIt.I<ActionButtonBloc>();
  @override
  Widget build(BuildContext context) {

    if(widget.typee == 'الحالية' && widget.status=='pending')
    {
      return BlocConsumer<ActionButtonBloc, ActionButtonStates>(
          bloc: cancelOrder,
          listener: (context, state) {
            if (state is CancelOrderLoading) {
              const AppLoadingView();
            } else if (state is CancelOrderSuccess) {
              Fluttertoast.showToast(msg: "تم الغاء  الطلب");
            } else if (state is CancelOrderFailure) {
              Fluttertoast.showToast(msg: "حدث خطأ برداء المحاوله لاجقا");
            }
          },
          listenWhen: (previous, current) =>
          current is CancelOrderLoading ||
              current is CancelOrderSuccess ||
              current is CancelOrderFailure,
          builder: (context, state) =>
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor:const Color(0xffFFE1E1)),
                      onPressed: () {cancelOrder.add(CancelOrderEvent(id: widget.id));
                      },
                      child:  Text(
                        'إلغاء الطلب',
                        style: kTextStyle14.copyWith(fontSize: 15,color: Colors.red),
                      ))
              )
      );}

    else if(widget.typee == 'المنتهية' && widget.status=='finished'){
      return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: () {
                navigateTo( const RateProductView());

              },
              child:const  Text(
                'تقييم المنتجات ',
                style:  kTextStyle14,
              )))
      ;
    }return const  SizedBox();
  }

}
