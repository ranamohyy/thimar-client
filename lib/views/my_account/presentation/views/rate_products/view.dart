import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rate/rate.dart';
import 'package:thimar/views/main/widgets/custom_app_bar.dart';
import 'package:thimar/views/my_account/presentation/view.dart';

import '../../../../../core/design/app_image.dart';
import '../../../../../core/logic/helper_method.dart';

class RateProductView extends StatelessWidget {
  const RateProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: 'orderDetails'.tr()),

      body
          :SingleChildScrollView(
        padding: EdgeInsetsDirectional.all(12),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [

      Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                AppImage(url:"tomato.png",height: 100,width: 100),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("طماطم",
                      style:TextStyle(fontSize: 17,
                          color: Color(0xff4C8613),
                          fontWeight: FontWeight.bold) ),
                  Text("السعر / 1كجم",
                      style:TextStyle(fontSize: 12,
                          color: Color(0xff808080),
                          fontWeight: FontWeight.w300)),
                  Row(
                    children: [
                      Text("45 ر.س", style:TextStyle(fontSize: 16,
                          color: Color(0xff4C8613),
                          fontWeight: FontWeight.bold)),
                      SizedBox(width: 8,),
                      Text("56 ر.س", style:TextStyle(fontSize: 12,
                          color: Color(0xff4C8613),
                          fontWeight: FontWeight.w300,
                      decoration: TextDecoration.lineThrough)),
                    ],
                  ),]),
    ]),
                  Center(child: Rate(allowHalf: true,color: Color(0xffFF9529),allowClear: true,iconSize:25 ,initialValue: 2,)),
                    SizedBox(
                      height: 70,
                      width: double.infinity,
                      child: TextFormField(
                        decoration:
                        InputDecoration(
                          border: OutlineInputBorder(borderRadius:
                          BorderRadius.circular(50)),
                          hintText:  "تعليق المنتج",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 9,
                            color: Color(0xffa29f9f),


                      ),



                        ),
                    )

                    ),],),
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppImage(url:"carrot.png",height: 100,width: 100),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("جزر",
                            style:TextStyle(fontSize: 17,
                                color: Color(0xff4C8613),
                                fontWeight: FontWeight.bold) ),
                        Text("السعر / 1كجم",
                            style:TextStyle(fontSize: 12,
                                color: Color(0xff808080),
                                fontWeight: FontWeight.w300)),
                        Row(
                          children: [
                            Text("45 ر.س", style:TextStyle(fontSize: 16,
                                color: Color(0xff4C8613),
                                fontWeight: FontWeight.bold)),
                            SizedBox(width: 8,),
                            Text("56 ر.س", style:TextStyle(fontSize: 12,
                                color: Color(0xff4C8613),
                                fontWeight: FontWeight.w300,
                                decoration: TextDecoration.lineThrough)),
                          ],
                        ),]),
                ]),
            Center(child: Rate(allowHalf: true,color: Color(0xffFF9529),allowClear: true,iconSize:25 ,initialValue: 2,)),
            SizedBox(
              height: 70,
              width: double.infinity,
              child: TextFormField(
                decoration:
                InputDecoration(
                  border: OutlineInputBorder(borderRadius:
                  BorderRadius.circular(50)),
                  hintText:  "تعليق المنتج",
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 9,
                    color: Color(0xffa29f9f),


                  )


                ),



              ),
            )

        ],),
SizedBox(height: 250,),
ElevatedButton(onPressed: (){
  navigateTo(MyAccountPage());
}, child:
Text("تقييم")


)

    ]),
          ),
    );
  }
}




class BottomSheetExample extends StatefulWidget {
  @override
  _BottomSheetExampleState createState() => _BottomSheetExampleState();
}

class _BottomSheetExampleState extends State<BottomSheetExample> {
  String selectedValue = "Select a value";  // Initial text for the container

  // Function to show bottom sheet and get the selected value
  void _showBottomSheet() async {
    final result = await showModalBottomSheet<String>(
      context: context,
      builder: (BuildContext context) {
        return
          Container(
          height: 200,
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text("Value 1"),
                onTap: () {
                  Navigator.pop(context, "Value 1"); // Return selected value
                },
              ),
              ListTile(
                title: Text("Value 2"),
                onTap: () {
                  Navigator.pop(context, "Value 2");
                },
              ),
              ListTile(
                title: Text("Value 3"),
                onTap: () {
                  Navigator.pop(context, "Value 3");
                },
              ),
            ],
          ),
        );
      },
    );

    // If result is not null, update the UI with the selected value
    if (result != null) {
      setState(() {
        selectedValue = result;  // Update the container text with the selected value
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bottom Sheet Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                selectedValue,  // Display the selected value
                style: TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showBottomSheet,  // Show bottom sheet on button press
              child: Text('Select Value'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: BottomSheetExample()));
