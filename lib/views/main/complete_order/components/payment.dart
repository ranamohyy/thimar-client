import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/app_image.dart';
import '../../../sheets/cards_sheet.dart';
import '../../widgets/payment_types.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});
  @override
  State<PaymentView> createState() => _PaymentViewState();
}
List images=["cash.png",];
class _PaymentViewState extends State<PaymentView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          displayBottomVisaSheet(context);
        },
        child:const  Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PaymentMethod(
              image: "cash.png",
              isActive: true,

            ),PaymentMethodItem(
              text: "VISA",
              isActive: false,

            ),PaymentMethod(
              image: "mastercard.png",
              isActive: false,

            ),
          ],
        ));

//       Row(children: [
//         Container(
//           height: 70.h,
//           width: 110.w,
//           decoration: BoxDecoration(
//             color: Colors.transparent,
//             borderRadius:BorderRadius.circular(12),
//
//
//           ),
//           child:
//           const Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//
//             children: [
//               AppImage(url:"cash.png",height: 25,width: 25),
//               SizedBox(width: 4,),
//               Text("كاش"),
//
//             ],
//           ),
//
//         ),
//         const SizedBox(width: 24,),
//         Container(
//           width: 90,
//           height: 70,
//           child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGxLsSADICaQJOLUpYb7Fp1jiebAzU3PjfXOZzt7_jqw&s"
//             ,height: 30,width: 30,
//
//           ),
//         ),
//         const SizedBox(width: 24,),
//
//         Container(
//           height:70 ,
//           width: 110,
//           child: Image.network(
//             "https://play-lh.googleusercontent.com/jMECkIn97zzMi1IoWlb9SYjtbYolSPmgdLmylwIwo3pbhQ_omkRMzM0bS-PnN461hg",
//
//             width: 40,
//             height: 40,
//           ),
//         ),            ],),
//     );
//   }
// }
  }}