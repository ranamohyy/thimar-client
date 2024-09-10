import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/views/my_account/presentation/view.dart';
import '../../../core/design/app_image.dart';
import '../data/products_bloc/model.dart';
import 'Notifications/view.dart';
import 'favorits/view.dart';
import 'home/view.dart';
import 'my_orders/view.dart';

class HomeNavView extends StatefulWidget {
  const HomeNavView({super.key});

  @override
  State<HomeNavView> createState() => _HomeNavViewState();
}

class _HomeNavViewState extends State<HomeNavView> {
  ProductModel? model;
 int currentPage=0;
 final tabs=<Widget>[
   const HomeView(),
   const MyOrdersView(),
   const NotificationsPage(),
   FavoritePage(),
   const MyAccountPage(),
 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

body: tabs[currentPage],
      bottomNavigationBar:BottomNavigationBar(
        onTap: (index)  {
          setState(() {
          currentPage=index;
        });},
        backgroundColor:const Color(0xff4C8613),
        selectedItemColor:Colors.white,
        selectedLabelStyle: const TextStyle(color: Colors.white),
        unselectedLabelStyle: const TextStyle(color: Colors.white),
        type: BottomNavigationBarType.fixed,
        elevation: 20,
        items: [
          BottomNavigationBarItem(

              icon: AppImage(url:"Home.png",
                height: 21.h
                ,
                width: 21.h,),
              label: "الرئيسية"

          ),
          BottomNavigationBarItem(

              backgroundColor:const Color(0xff4C8613),
              icon: AppImage(url:"طلباتي.png",
                height: 21.h
                ,
                color: Colors.white,
                width: 21.h,),
              label: "طلباتي"

          )  ,
          const BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none_outlined, color: Colors.white,),
              label: "الاشعارات"

          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border, color: Colors.white,),
            label: "المفضلة",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person,
              color: Colors.white,),
            label:
            "حسابي",
          ),




        ],
      ),
    );
  }
}
