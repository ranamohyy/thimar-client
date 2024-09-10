import 'package:flutter/material.dart';
import 'package:thimar/constans.dart';
import 'package:thimar/core/design/app_image.dart';

class CategoryProductsView extends StatefulWidget {
  const CategoryProductsView ({super.key});

  @override
  State<CategoryProductsView> createState() => _CategoryProductsViewState();
}

class _CategoryProductsViewState extends State<CategoryProductsView> {
  List<Map<String,String>>item=[
  {"image" : "tomato.png",
    "title" : "طماطم",
    },
    {
      "image":"carrot.png",
      "title":"جزر",
  },
    {"image" : "tomato.png",
      "title" : "طماطم",
    },
    {
      "image":"carrot.png",
      "title":"جزر",
    },
    {"image" : "tomato.png",
      "title" : "طماطم",
    },
    {
      "image":"carrot.png",
      "title":"جزر",
    },


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "خضروات",
          style: TextStyle(
              color: Color(0xff4C8613),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {

          },
          child: const Stack(
            alignment: Alignment.center,
            children: [
              AppImage(url:"Rectangle .png", height: 40, width: 40),
              BackButton(color: kPrimaryColor,)
              // AppImage(url:"Arrow_Right .png",
              //     height: 15, width: 15, fit: BoxFit.fill),
            ],
          ),
        ),


      ),
      body:SafeArea(
        child: SingleChildScrollView(
          child: Column (children: [
            Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: [
                TextFormField(
                onTap: (){},
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search,size: 25,),
                  label: Text("ابحث عن ماتريد؟",
                  style: TextStyle(
                    color: Color(0xffB9C9A8),
                    fontSize: 15,
                    fontWeight: FontWeight.w800

                  ),)
                ),
              ),
                const AppImage(url:"panadol.png",height: 60,width: 60,)
            ]),
            const SizedBox(height: 20,),
            GridView.builder(
              itemCount: item.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 200/290
                ),
              itemBuilder:(context, index) =>
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(

                          children: [
                          AppImage(url:"${item.elementAt(index)['image']}" ,width: 300,
                            height: 150,
                          ),
                          const AppImage(url:"sale.png",height: 30,width: 40,)
                        ],
                        alignment: Alignment.topLeft,
                        ),
                        Text("${item.elementAt(index)['title']}",
                          style: const TextStyle(
                            color: Color(0xff4C8613),
            fontSize: 16,
            fontWeight: FontWeight.bold),),
      const Text("السعر / 1 كجم",
        style: TextStyle(
            color: Color(0xff757575),
            fontSize: 12,
            fontWeight: FontWeight.w300),),
      Row(

        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(" 45 ر.س ", style: TextStyle(
              color: Color(0xff488011),
              fontWeight: FontWeight.bold,
              fontSize: 16)),
          const Text("56 ر.س", style: TextStyle(
              color: Color(0xff4C8613),
              decoration: TextDecoration.lineThrough)),
          IconButton(
              color: const Color(0xff61B80C),
              onPressed: () {},
              icon: const Icon(Icons.add)),
        ],
      ),
                      ],
                    ),
                  )
              ,
            )


          ],),
        ),
      )
    );
  }
}
