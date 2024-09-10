import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:thimar/views/main/data/show_cart_bloc/bloc.dart';
import '../../../constans.dart';
import '../../../core/design/app_image.dart';
import '../data/get_cart_bloc/send_item_cart_bloc.dart';
class CustomItem extends StatefulWidget {
  const CustomItem({super.key, required this.cartModel});
final ProductCartModel cartModel;
  @override
  State<CustomItem> createState() => _CustomItemState();}
class _CustomItemState extends State<CustomItem> {
  final editBloc=GetIt.I<EditCartBloc>();

  @override
  Widget build(BuildContext context) {

    return Column(children: [
      Container(
        padding:const EdgeInsetsDirectional.only(top: 10, bottom: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(16),
        ),
        width: 400,
        child: Row(
            children: [
              AppImage(
                  url:widget.cartModel.image
                  , height: 90,
                  width:100),
              Column(
                children: [
                  Text(
                      widget.cartModel.title,
                      style:kTextStyle16),
                  Text("${widget.cartModel.price.toString()} ر.س",
                      style:kTextStyle15),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 30.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8.r)),
                            color: kPrimaryColor.withOpacity(0.1)
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ///increaseAmount
                            GestureDetector(
                              onTap:(){
                                widget.cartModel.amount++;

                                editBloc.add(PutAmountEvent(id:widget.cartModel.id,
                                    amount:widget.cartModel.amount)
                                );

                                setState(() {
                                });
                              },

                              child: const Icon(Icons.add,color: kPrimaryColor,size: 18,),
                            ),
                            SizedBox(width: 4.w,),
                            Text(widget.cartModel.amount.toString(),style: kTextStyle16,),
                            SizedBox(width: 6.w,),

                            ///decreaseAmount
                            GestureDetector(
                                onTap: () {
                                  if(widget.cartModel.amount<0){
                                    widget.cartModel.amount++;
                                  }
                                  setState(() {
                                    widget.cartModel.amount--;
                                    editBloc.add(PutAmountEvent(id:widget.cartModel.id,
                                        amount:widget.cartModel.amount)
                                    );                            },);
                                },

                                child:const  Icon(FontAwesomeIcons.minus,color: kPrimaryColor,size: 17,)
                            ),
                          ]),
                    ],
                  )
                ],
              ),
              SizedBox(
                width: 110.w,
              ),
              GestureDetector(
                  onTap: () {
                    editBloc.add(
                        DeleteItemEvent(id: widget.cartModel.id.toString()));
// removeItem(state.list.data[index].id);
                  },
                  child:const AppImage(
                    url:"delete_icon.png",
                    height: 30,
                    width: 30,
                  ))
            ]),
      ), ]);

}}