import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:thimar/views/my_account/presentation/views/rate_products/view.dart';
import '../../../constans.dart';
import '../../../core/design/app_image.dart';
import '../../../core/design/app_loading.dart';
import '../../../core/logic/helper_method.dart';
import '../widgets/custom_app_bar.dart';
import '../data/actionButtonsBloc/action_button_bloc.dart';
import '../widgets/custom_flag_button.dart';
import '../widgets/custom_order_builder.dart';

class OrderDetailsView extends StatefulWidget {
  const OrderDetailsView(
      {super.key,
        required this.type,
        required this.id,
        required this.location,
        required this.clientName,
        required this.date,
        required this.price,
        required this.statusNumber,
        required this.totalPrice,
        required this.deliveryPrice,
        required this.orderPrice,
        required this.payType});

  final String type;
  final int id;
  final String location;
  final String clientName;
  final DateTime date;
  final String price;
  final String statusNumber;
  final String totalPrice;
  final String deliveryPrice;
  final String orderPrice;
  final String payType;

  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView> {
  final action = GetIt.I<ActionButtonBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          Bottom(
        typee: widget.type,
        id: widget.id,
        status: widget.statusNumber,
        totalPrice: widget.totalPrice,
      ),
      appBar: CustomAppBar(
        text: "طلب #${widget.id}",

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemBuilderForOrder(
              clientName: widget.clientName,
              date: DateTime.parse("${widget.date}"),
              price: widget.price,
              orderNumber: widget.id,
              statusOrder: widget.statusNumber,
            ),
             SizedBox(
              height: 30.h,
            ),
            const Text(
              'عنوان التوصيل',
              style: kTextStyle18,
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.location,
                  style: kTextStyle16light,
                ),
                Stack(alignment: Alignment.center, children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      AppImage(
                        url: "googleMap.png",
                        height: 80.h,
                        width: 80.w,
                      ),
                      AppImage(
                        url: "coverMap.png",
                        height: 80.h,
                        width: 80.w,
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.chevron_right_outlined,
                    color: Colors.white,
                    size: 25,
                  )
                ])
              ],
            ),
            SizedBox(
              height:18.h,
            ),
            const Text("ملخص الطلب", style: kTextStyle18),
            SizedBox(
              height: 18.h,
            ),
            Container(
              decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.1),

                  borderRadius: BorderRadius.all(Radius.circular(12.r))
              ),
              height: 180.h,
              width: 440.w,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Row(children: [
                    const Text("إجمالي المنتجات", style: kTextStyle16),
                    const Spacer(),
                    Text(widget.totalPrice.toString(),
                        style: kTextStyle15normal)
                  ]),
                  const Divider(
                    thickness: 0.15,
                  ),
                  Row(children: [
                    const Text("سعر التوصيل", style: kTextStyle16),
                    const Spacer(),
                    Text(
                      widget.deliveryPrice.toString(),
                      style: kTextStyle15normal,
                    )
                  ]),
                  const Divider(
                    thickness: 0.15,
                  ),
                  Row(children: [
                    const Text("المجموع", style: kTextStyle16),
                    const Spacer(),
                    Text(widget.orderPrice.toString(),
                        style: kTextStyle15normal)
                  ]),
                  const Divider(
                    thickness: 0.15,
                  ),
                  SizedBox(height: 8.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("تم الدفع بواسطة${widget.payType}",
                          style: kTextStyle15normal),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
