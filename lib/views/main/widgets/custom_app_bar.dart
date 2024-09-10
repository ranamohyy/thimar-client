import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constans.dart';

   class CustomAppBar extends StatelessWidget  implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.text,});

  final String text;

  @override
  Widget build(BuildContext context) {
    return AppBar(

      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
          text,
          style: kTextStyle18.copyWith(fontSize: 20)

      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child:
         Stack(
          alignment: Alignment.center,
          children:  [
            Container(height: 43, width: 43,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color:kPrimaryColor.withOpacity(0.1)
              ),
            ),
            const Icon(FontAwesomeIcons.chevronRight, color: kPrimaryColor, size: 15,)

          ],
        ),
      ),


    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);


}
