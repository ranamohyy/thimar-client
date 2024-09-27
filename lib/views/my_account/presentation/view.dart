import 'package:flutter/material.dart';
import 'package:thimar/constans.dart';
import 'package:thimar/core/design/app_image.dart';
import 'package:thimar/core/logic/helper_method.dart';
import 'package:thimar/views/main/home_nav/view.dart';
import 'package:thimar/views/my_account/presentation/views/about_app/view.dart';
import 'package:thimar/views/my_account/presentation/views/change_language/change_language_view.dart';
import 'package:thimar/views/my_account/presentation/views/contact%20us/view.dart';
import 'package:thimar/views/my_account/presentation/views/faqs/view.dart';
import 'package:thimar/views/my_account/presentation/views/pay/view.dart';
import 'package:thimar/views/my_account/presentation/views/privacy/view.dart';
import 'package:thimar/views/my_account/presentation/views/rate_app/view.dart';
import 'package:thimar/views/my_account/presentation/views/suggestions/view.dart';
import 'package:thimar/views/my_account/presentation/views/terms/view.dart';
import '../../../core/logic/cache_helper.dart';
import '../../auth/presentation/login/view.dart';
import 'views/addresses/view.dart';
import 'views/my_profile/view.dart';
import 'views/share_app/view.dart';
import 'views/wallet/view.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage ({super.key});

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {


  List tabs=  [
    const MyProfileView(),
   WalletView(),
  const  AddressesView(type: "العناوين",),
    const paymentview(),
    const FAQSView(),
    const PrivacyView(),
    const ContactUsView(),
    const SuggestionsView(),
    const  ShareAppView(),
    const AboutAppView(),
    const ChangeLanguageView(),
    const  TermsView(),
    const  RateApp(),

 ];
  List<Map<String,String>> item=[
    {
      "icon":"User.png",
      "title":"البيانات الشخصية"
    } ,{
      "icon":"mhfza.png",
      "title":"المحفظة"
    }, {
      "icon":"location.png",
      "title":"العناوين"
    }, {
      "icon":"money.png",
      "title":"الدفع"
    } ,{
      "icon":"question.png",
      "title":"أسئلة متكررة"
    } ,{
      "icon":"privacy.png",
      "title":"سياسة الخصوصية"
    } ,{
      "icon":"calling.png",
      "title":"تواصل معنا"
    } ,{
      "icon":"edit_pen .png",
      "title":"الشكاوي والأقتراحات"
    } ,{
      "icon":"share.png",
      "title":"مشاركة التطبيق"
    } ,{
      "icon":"info.png",
      "title":"عن التطبيق"
    } ,{
      "icon":"change_language.png",
      "title":"تغيير اللغة"
    } ,{
      "icon":"note.png",
      "title":"الشروط والأحكام"
    }, {
      "icon":"star.png",
      "title":"تقييم التطبيق"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return   Scaffold(

      extendBodyBehindAppBar: true,
     appBar: PreferredSize(

      preferredSize: const Size.fromHeight(260),child:
          Stack(
     alignment: Alignment.centerLeft,

    children: [
      Container(
      height: 260,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(bottomLeft:Radius.circular(50),bottomRight: Radius.circular(50))
      ),
      child: Column
        (children: [
        const   SizedBox(height: 50,),
        const Text("حسابي"
          ,style: kTextStyle20
        ),
        const SizedBox(height: 23,),
        ClipRRect(
           borderRadius: BorderRadius.circular(20),
          child: Image.network(CachHelper.image.toString(),
            height:70,width: 70,fit: BoxFit.fill,


          ),
        ),
        const SizedBox(height: 3,),
        Text(CachHelper.userName.toString() ,
            style:kTextStyle14),
       const SizedBox(height: 4,),
        Text(CachHelper.phoneNumber.toString() ,
          style:kTextStyle15light.copyWith(color: Colors.black38)),

      ],)
    ),
    const AppImage(url:"circuts.png",height: 300,width: 400,fit: BoxFit.fill, )
    ]
  ),),
      body:SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

            const SizedBox(height: 10,),
          GridView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
          physics:const  NeverScrollableScrollPhysics(),
            itemCount: item.length,
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 250/35,

              ), itemBuilder: (context, index) =>
              ListTile(
            onTap: ()
            {
              navigateTo(tabs[index]);
            },

            title:
            Text(
                "${ item.elementAt(index)['title'] }",
                style: kTextStyle17
            ),
            trailing:
            const AppImage(url: "go_icon.png",height: 30,width:30),

            leading:
            AppImage(url: "${item.elementAt(index)['icon']}",
            height: 29,width: 27,color: kPrimaryColor) ,

          )),
            GestureDetector(
              onTap: (){navigateTo(const LoginView());},
              child:const  ListTile(trailing:
              AppImage(
                  url: "Turn off.png",height: 26,width: 26) ,title:
              Text(
                "تسجيل الخروج" ,
                style: kTextStyle17
                ,)),
            )

          ],),
        ),
      )
    );
  }
}
