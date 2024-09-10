import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thimar/core/design/app_image.dart';
import 'package:thimar/views/my_account/presentation/view.dart';

import '../../../../../core/logic/helper_method.dart';


class paymentview extends StatelessWidget {
  const paymentview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar:  AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "الدفع",
          style: TextStyle(
              color: Color(0xff4C8613),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            navigateTo((MyAccountPage()));
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              AppImage(url: "Rectangle .png", height: 40, width: 40),
              AppImage(url: "Arrow_Right .png",
                  height: 15, width: 15, fit: BoxFit.fill),
            ],
          ),
        ),


      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 30,),

              AppImage(url: "VISA.png",fit: BoxFit.fill,width: 500,height:350
                ),
             AppImage(url: "VISA2.png",width: double.infinity,height:250,),

              SizedBox(height: 30,),
              ElevatedButton(

                  onPressed: (){
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),

                        context: context, builder: (context) =>
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                          Center(child: Text("إضافة بطاقة",style: TextStyle(color: Color(0xff4C8613),fontWeight: FontWeight.bold,fontSize: 15),)),
                          TextFormField(decoration: InputDecoration(
                              hintText: "اسم صاحب البطاقة",

                              hintStyle: TextStyle(
                                  color: Color(0xff8B8B8B),
                                  fontSize: 15
                              ),
                              border: OutlineInputBorder(

                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Color(0xffDCDCDC),),


                              )





                          )),
                          SizedBox(height: 20,),
                          TextFormField(decoration: InputDecoration(
                              hintText: "رقم البطاقة",

                              hintStyle: TextStyle(
                                  color: Color(0xff8B8B8B),
                                  fontSize: 15
                              ),
                              border: OutlineInputBorder(

                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Color(0xffDCDCDC),),


                              )





                          )),
                              SizedBox(height: 20,),

                              Row(children: [
                            SizedBox(
                              width: 150,
                              child: TextFormField(decoration: InputDecoration(
                                  hintText: "تاريخ الإنتهاء (شهر / سنة)",

                                  hintStyle: TextStyle(
                                      color: Color(0xff8B8B8B),
                                      fontSize: 15
                                  ),
                                  border: OutlineInputBorder(

                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: Color(0xffDCDCDC),),


                                  )





                              )),
                            ),
                            SizedBox(width: 40,),
                            SizedBox(
                              width: 150,

                              child: TextFormField(decoration: InputDecoration(
                                  hintText: "(Cvv) الرقم السري ",

                                  hintStyle: TextStyle(
                                      color: Color(0xff8B8B8B),
                                      fontSize: 15
                                  ),
                                  border: OutlineInputBorder(

                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: Color(0xffDCDCDC),),


                                  )





                              )),
                            ),

                          ],),
                              SizedBox(height: 20,),

                              ElevatedButton(onPressed: (){}, child: Text("إضافة بطاقة"))

                        ]),
                      ));
                  },
                  child: Text("إضافة بطاقة", style: TextStyle(
                      color: Color(0xff4C8613),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  ),
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xffF9FCF5)),)


        ]),
      ),

    );
  }
}
