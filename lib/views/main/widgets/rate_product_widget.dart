import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:rate/rate.dart';
import '../../../constans.dart';
import '../../../core/app_failure/custom_error_widget.dart';
import '../../../core/design/app_image.dart';
import '../../../core/design/app_loading.dart';
import '../data/rate_products/bloc.dart';
class RateProductWidget extends StatefulWidget {
  const RateProductWidget({super.key, required this.id});
  final int id;

  @override
  State<RateProductWidget> createState() => _RateProductWidgetState();
}

class _RateProductWidgetState extends State<RateProductWidget> {
  final rateBloc = GetIt.I<RateProductBloc>();
  @override
  void initState() {
    rateBloc.add(RateProductEvent(id: widget.id));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
      Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
      Row(
        children: [
           Text(
            "التقييمات",
            style: TextStyle(
              fontFamily: kTextFamily,
                color: kPrimaryColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              rateBloc.add(RateProductEvent());
            },
            child:  Text(
              "عرض الكل",
              style: TextStyle(
                  fontFamily: kTextFamily,

                  color: kPrimaryColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w200),
            ),
          ),
        ],
      ),
      BlocBuilder<RateProductBloc,RateProductStates>(
          bloc: rateBloc,
          builder:(context, state) {
            if(state is RateProductSuccessState) {
              return SizedBox(
                height: 100,
                  child:
                  GridView.builder(
                    gridDelegate:const
                    SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,mainAxisSpacing: 4,
                      childAspectRatio: 2.6 /10

                    ),
                    physics:const BouncingScrollPhysics() ,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.list.length,
                    itemBuilder: (context, index) =>
                        Container(
                          decoration:
                          BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(12.r),),
                          child: IntrinsicHeight(
                            child: Row(
                            mainAxisSize: MainAxisSize.min,
                           crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:EdgeInsets.zero,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            state.list[index].clientName,
                                            style: TextStyle(
                                                fontFamily: kTextFamily,
                                                color: Colors.black,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(width: 8.w,),
                                          Rate(
                                            iconSize: 20.r,
                                            color: const Color(0xffFF9529),
                                            allowHalf: true,
                                            allowClear: true,
                                            initialValue:state.list[index].value.toDouble(),
                                            readOnly: false,
                                            onChange: (value) =>{
                                              value=state.list[index].value.toDouble()
                                            },
                                          )
                                        ],
                                      ),
                                  SizedBox(height: 10.h,),
                                      Text(
                                        state.list[index].comment,
                                        style: TextStyle(
                                            fontFamily: kTextFamily,
                                            color: Colors.black,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w100),
                                      )
                                    ],
                                  ),
                                ),
                                 SizedBox(width: 40.w,),
                                AppImage(url: state.list[index].clientImage,
                                    height: 100.h,
                                    width: 120.w),

                              ],
                            ),
                          ),
                        ),
                  ));
            }
            else if (state is RateProductLoadingState){
              return const AppLoadingView();
            }else if (state is RateProductFailureState){
              return CustomErrorWidget(errMessage: state.errMessage);
            }
            return const SizedBox();
          } ),
    ],);
  }
}
