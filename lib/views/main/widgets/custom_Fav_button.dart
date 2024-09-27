import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:thimar/views/main/data/toggle_fav/toggle_favorite_bloc.dart';
import '../../../constans.dart';
import '../../../core/design/app_image.dart';

class CustomFavButton extends StatefulWidget {
  const CustomFavButton({super.key, required this.id, required this.isFav});
  final int id;
  final bool isFav;
  @override
  State<CustomFavButton> createState() => _CustomFavButtonState();
}

class _CustomFavButtonState extends State<CustomFavButton> {
  final toggle = GetIt.I<ToggleFavBloc>();
  late bool isFav = widget.isFav;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        bloc: toggle,
        listener: (context, state) {
          if (state is ToggleFavoriteSuccessState) {
            isFav = !isFav;
            setState(() {});
          }
        },
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              toggle.add(ToggleFavoriteEvent(
                is_favorite: widget.isFav,
                id: widget.id,
              ));
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 42.h,
                  width: 43.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: kPrimaryColor.withOpacity(0.1)),
                ),
                AppImage(
                    url: "heart-empty.png",
                    height: 20.5.h,
                    width: 20.5.h,
                    fit: BoxFit.fill,
                    color: isFav == true ? Colors.white : kPrimaryColor),
              ],
            ),
          );
        });
  }
}
