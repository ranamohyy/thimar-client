import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/constans.dart';

import '../../widgets/Search_bar.dart';
import '../../widgets/custom_app_bar_home.dart';
import '../categries_view/view.dart';
import '../products_view/view.dart';
import '../slider_view/view.dart';
class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
appBar:  CustomAppBarHome (),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body:SafeArea(
        child: SingleChildScrollView(



          padding:  EdgeInsets.symmetric(vertical: 5.h,horizontal: 2.w),
          child: Column(

            children: [
              const  CustomSearchBar(),
              SizedBox(height: 30.h,),
              const  SliderView(),
              SizedBox(height: 30.h,),

           //categories
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    const Text("الأقسام",style: kTextStyle16light),
                const  Spacer(),
                  TextButton(
                     onPressed: (){},
                     child: const Text("عرض الكل"),),
                    ],
                  ),
               ListFeatchCatogries(),
              SizedBox(height: 12.h,),

            //products
               const Row(
                children: [
                    Text("الاصناف",
                      style: kTextStyle16light,
                 ),
                ],
              ),

              const ProductsView(),

            ],
          ),
        ),
      ),





    );
  }
}
