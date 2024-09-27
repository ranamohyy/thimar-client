part of 'package:thimar/views/main/product_details/view.dart';
class CustomProductDetailsAppBar extends StatelessWidget implements PreferredSizeWidget{
   CustomProductDetailsAppBar({super.key,required this.id,required this.isFav});
  bool ?isFav;
  int ?id;
  @override
  Widget build(BuildContext context) {
    return
      AppBar(

      elevation: 0,
      backgroundColor: Colors.white,
      actions: [
        CustomFavButton(
          id: id!,
          isFav:isFav!,
        ),
      ],
      leading: GestureDetector(
        onTap: () {
          navigateTo(const HomeNavView());
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 43,
              width: 43,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: kPrimaryColor.withOpacity(0.1)),
            ),
            const Icon(
              FontAwesomeIcons.chevronRight,
              color: kPrimaryColor,
              size: 15,
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);


}
