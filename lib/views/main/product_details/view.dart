import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:thimar/core/design/app_image.dart';
import 'package:thimar/core/design/app_loading.dart';
import 'package:thimar/core/logic/helper_method.dart';
import 'package:thimar/views/main/data/show_cart_bloc/bloc.dart';
import 'package:thimar/views/main/home_nav/view.dart';
import 'package:thimar/views/main/widgets/rate_product_widget.dart';
import 'package:thimar/views/main/widgets/simillar_items_widget.dart';
import '../../../constans.dart';
import '../../../core/app_failure/custom_error_widget.dart';
import '../cart/view.dart';
import '../data/get_cart_bloc/send_item_cart_bloc.dart';
import '../data/product_details/bloc.dart';
import '../data/similar_products/similar_products_bloc.dart';
import '../widgets/custom_Fav_button.dart';
import '../widgets/custom_bottom_bar_cart_sheet.dart';

class ProductDetailsView extends StatefulWidget {
  ProductDetailsView({
    super.key,
    this.desc,
    this.discount,
    this.image,
    this.id,
    this.afterDiscount,
    this.title,
    this.beforeDiscount,
    this.isFav,
    this.categoryId,
  });

  num? discount, beforeDiscount, afterDiscount;
  String? image, title, desc;
  int? id, categoryId;

  bool? isFav;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  final bloc = GetIt.I<ProductDetailsBloc>()..add(ProductDetailsEvent());
  final sendBloc = GetIt.I<EditCartBloc>();
  late final blocSimilar = GetIt.I<SimilarProductsBloc>()
    ..add(SimilarProductsEvent(categoryId: widget.categoryId));

  bool isPressed = false;
  late int initialAmount = 1;
  late CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocConsumer(
        listener: (context, state) {
          if (state is SendItemCartSuccessState) {
            showModalBottomSheet(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                top: Radius.circular(40.r),
              )),
              context: context,
              builder: (context) {
                return SizedBox(
                    height: 180,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 7.h,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.check_box,
                                    color: Color(0xff93bd62)),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  "تم إضافة المنتج بنجاح",
                                  style: kTextStyle16.copyWith(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            children: [
                              AppImage(
                                  url: widget.image!,
                                  height: 65.h,
                                  width: 65.w),
                              SizedBox(
                                width: 8.w,
                              ),
                              Column(
                                children: [
                                  Text(
                                    widget.title!,
                                    style: kTextStyle14.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                        color: kPrimaryColor),
                                  ),
                                  Text("الكميه :  $initialAmount",
                                      style: TextStyle(
                                          fontFamily: kTextFamily,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w300,
                                          color: const Color(0xff7E7E7E))),
                                  Text(
                                      "${initialAmount * widget.beforeDiscount!}"
                                          .toString(),
                                      style: TextStyle(
                                          fontFamily: kTextFamily,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                          color: kPrimaryColor)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                  height: 50.h,
                                  width: 140.w,
                                  child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          backgroundColor:
                                              isPressed != isPressed
                                                  ? kPrimaryColor
                                                  : Colors.white,
                                          side: const BorderSide(
                                              color: kPrimaryColor),
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(12),
                                            ),
                                          )),
                                      onPressed: () {
                                        isPressed != isPressed;
                                        setState(() {});
                                        navigateTo(const CartView());
                                      },
                                      child: Text(
                                        "التحويل إلى السلة",
                                        style: kTextStyle14.copyWith(
                                            color: isPressed != isPressed
                                                ? Colors.white
                                                : kPrimaryColor),
                                      ))),
                              SizedBox(
                                  height: 50.h,
                                  width: 140.w,
                                  child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          backgroundColor:
                                              isPressed != isPressed
                                                  ? Colors.white
                                                  : kPrimaryColor,
                                          side: const BorderSide(
                                              color: kPrimaryColor),
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(12),
                                            ),
                                          )),
                                      onPressed: () {
                                        isPressed != isPressed;
                                        setState(() {});
                                        navigateTo(const CartView());
                                      },
                                      child: Text(
                                        "تصفح العروض",
                                        style: kTextStyle14.copyWith(
                                            color: isPressed != isPressed
                                                ? kPrimaryColor
                                                : Colors.white),
                                      ))),
                            ],
                          )
                        ],
                      ),
                    ));
              },
            );
          } else if (state is SendItemCartFailureState) {
            SendItemCartFailureState(errMessage: state.errMessage);
          }
        },
        bloc: sendBloc,
        builder: (context, state) {
          if (state is SendItemCartInitial) {
            return const SizedBox();
          }
          return GestureDetector(
            onTap: () {
              setState(() {});
              sendBloc.add(SendItemCartEvent(
                  productId: widget.id!, amount: initialAmount));
            },
            child:
                // BottomAppBar(
                Container(
              height: 55,
              color: kPrimaryColor,
              child: CustomBottomBarCart(
                cartTotal: "${initialAmount * widget.beforeDiscount!}",
              ),
            ),
          );
        },
      ),
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          CustomFavButton(
            id: widget.id!,
            isFav: widget.isFav!,
          ),
        ],
        leading: GestureDetector(
          onTap: () {
            navigateTo(const HomeNavView());
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 43,
                width: 43,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: kPrimaryColor.withOpacity(0.1)),
              ),
              const Icon(
                FontAwesomeIcons.chevronRight,
                color: kPrimaryColor,
                size: 15,
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                if (state is ProductDetailsSuccessState) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(1.0.r),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              AppImage(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(40.r),
                                    bottomRight: Radius.circular(40.r),
                                    topLeft: Radius.circular(21.r),
                                    topRight: Radius.circular(21.r)),
                                height: 250.h,
                                width: MediaQuery.of(context).size.width,
                                url: widget.image!,
                                fit: BoxFit.fitHeight,
                              ),
                            ]),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.only(start: 12.h, end: 12.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: 8.h,
                            ),
                            ////price and discount of the product///
                            Row(
                              children: [
                                ////title of the product ///
                                Text(widget.title!,
                                    style: kTextStyle16.copyWith(
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.w800)),

                                const Spacer(),

                                ////amount  of discount  ///
                                Text("%${(widget.discount! * 100).toInt()}",
                                    style: const TextStyle(
                                        fontFamily: kTextFamily,
                                        color: Color(0xffFF0000))),

                                SizedBox(
                                  width: 8.w,
                                ),

                                ////price before discount///
                                Text("${widget.beforeDiscount.toString()}ر.س",
                                    style: const TextStyle(
                                        fontFamily: kTextFamily,
                                        color: Color(0xff488011),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),

                                SizedBox(
                                  width: 8.w,
                                ),

                                ////price after discount///
                                Text("${widget.afterDiscount.toString()}ر.س",
                                    style: const TextStyle(
                                        fontFamily: kTextFamily,
                                        color: kPrimaryColor,
                                        decoration:
                                            TextDecoration.lineThrough)),
                              ],
                            ),
                            Row(
                              children: [
                                Text("السعر / 1كجم",
                                    style: kTextStyle15light.copyWith(
                                        fontSize: 18)),
                                const Spacer(),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      height: 30.h,
                                      width: 80.w,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.r)),
                                          color:
                                              kPrimaryColor.withOpacity(0.1)),
                                    ),
                                    Row(children: [
                                      GestureDetector(
                                        onTap: () {
                                          // blocAmount.add(PutAmountEvent(
                                          //     id: widget.id,
                                          //     amount: initialAmount));
                                          setState(() {
                                            initialAmount++;
                                            widget.afterDiscount! *
                                                initialAmount;
                                          });
                                        },
                                        child: const Icon(
                                          Icons.add,
                                          color: kPrimaryColor,
                                          size: 18,
                                        ),
                                      ),
                                      Text("$initialAmount"),
                                      GestureDetector(
                                          onTap: () {
                                            // blocAmount.add(PutAmountEvent(
                                            //     id: widget.id,
                                            //     amount: initialAmount));
                                            setState(() {
                                              initialAmount--;
                                              widget.afterDiscount! *
                                                  initialAmount;
                                            });
                                            return setState(() {
                                              initialAmount++;
                                            });
                                          },
                                          child: const Icon(
                                            FontAwesomeIcons.minus,
                                            color: kPrimaryColor,
                                            size: 17,
                                          )),
                                    ]),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("كود المنتج",
                                    style: kTextStyle16.copyWith(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w800)),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text(
                                  widget.id.toString(),
                                  style: kTextStyle16light,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: Text("تفاصيل المنتج",
                                    style: kTextStyle16.copyWith(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w800))),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(widget.desc!,
                                style: kTextStyle16light.copyWith(
                                    color: const Color(0xff808080),
                                    fontWeight: FontWeight.w400)),
                            Padding(
                              padding: EdgeInsets.only(top: 4.0.h, right: 8.w),
                              child: RateProductWidget(
                                id: widget.categoryId!,
                              ),
                            ),
                            Text(
                              "عناصر مشابهه",
                              style: TextStyle(
                                  fontFamily: kTextFamily,
                                  color: kPrimaryColor,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                                height: 155,
                                width: 170,
                                child: SimilarItemsWidget(
                                  categoryId: widget.categoryId!,
                                ))
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (state is ProductDetailsLoadingState) {
                  return const AppLoadingView();
                } else if (state is ProductDetailsFailureState) {
                  return CustomErrorWidget(
                    errMessage: state.errMessage,
                  );
                }
                return const SizedBox();
              }),

          SizedBox(
            height: 10.h,
          ),

          // ]),
        ]),
      ),
    );
  }
}
