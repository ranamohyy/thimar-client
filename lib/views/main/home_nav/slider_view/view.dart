import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:thimar/core/app_failure/custom_error_widget.dart';
import '../../../../../../../../core/design/app_image.dart';
import '../../data/slider_bloc/bloc.dart';
import '../../widgets/custom_slider_loading.dart';
class SliderView extends StatefulWidget {
 const  SliderView({super.key});

  @override
  State<SliderView> createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  final sliderBloc = GetIt.I<SliderViewBloc>()..add(LoadSliderEvent());
//
@override
  Widget build(BuildContext context) {
    return  BlocBuilder(
        bloc: sliderBloc,
        builder: (context, state) {
          if (state is SliderLoadingState) {
            return const CustomSliderLoading();
          }
          else if(state is SliderSuccessState) {
            return
              SizedBox(
              height: 164.h,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: CarouselSlider(
                options: CarouselOptions(
                    scrollDirection: Axis.horizontal,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    viewportFraction:1,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 164.w / 375.h),
                items:
                List.generate(
                    state.list.length, (index) =>
                    SizedBox(
                      height: 375.h,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: AppImage(

                        url: state.list[index].media,
                        fit: BoxFit.fill,
                      ),
                    )
                ),

              ),

            );
          }
          else if(state is SliderFailedState) {

            return  CustomErrorWidget(errMessage: state.errMessage,);
          }
          return const SizedBox(
          );
        });
  }
}
