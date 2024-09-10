import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,

        title: const Text("الإشعارات",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color:  Color(0xff4C8613)
          ),),
        centerTitle: true,
      ),
      body: const SafeArea(

        child: Padding(
          padding:  EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Text("تم قبول طلبك وجاري تحضيره الأن",

            ),
            Text("هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى"
            , style: TextStyle(
                    fontWeight:   FontWeight.w500,
                    fontSize: 10,
                    color: Color(0xff989898)
                )


            ),
            Text("منذ ساعتان", style: TextStyle(
                fontWeight:   FontWeight.w300,
                fontSize: 10,
                color: Colors.black
            )),
            SizedBox(height: 20,),
            Text("رسالة إدارية"

            ),
            Text("هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم\n توليد هذا النص من مولد النص العربى"
                , style: TextStyle(
                    fontWeight:   FontWeight.w500,
                    fontSize: 10,
                    color: Color(0xff989898)
                )),
            Text("منذ ساعتان",
                style: TextStyle(
                fontWeight:   FontWeight.w500,
                fontSize: 10,
                color: Colors.black
            )),
            SizedBox(height: 20,),

Text("عروض جديدة بإنتظارك"),
Text("هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم \nتوليد هذا النص من مولد النص العربى"
    , style: TextStyle(
            fontWeight:   FontWeight.w400,
            fontSize: 10,
            color: Color(0xff989898)
    )),
Text("منذ ساعتان",
    style: TextStyle(
          fontWeight:   FontWeight.w300,
          fontSize: 10,
          color: Colors.black
    )),



          ]),
        ),
      ),
    );
  }
}
