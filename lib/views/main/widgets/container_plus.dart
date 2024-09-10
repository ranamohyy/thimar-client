import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:thimar/views/main/data/get_cart_bloc/send_item_cart_bloc.dart';

import '../../../core/design/app_image.dart';

class Plus_Minus extends StatefulWidget {
  Plus_Minus(
      {super.key, required this.id, required this.totalPrice, this.items});

  final int id, totalPrice;
  int?items;

  @override
  State<Plus_Minus> createState() => _Plus_MinusState();
}

class _Plus_MinusState extends State<Plus_Minus> {
  final addAmount = GetIt.I<EditCartBloc>();
  late int newAdding = 0;
  late int newValue = widget.items! + newAdding;
  @override
  void initState() {
    PutAmountEvent(id: widget.id,amount: newValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      Stack(
        alignment: Alignment.center,
        children: [
        AppImage(url:
        "Rectangle_rrrr.png",
        height: 50.w,
        width: 90.w,
      ),
    BlocBuilder<EditCartBloc,EditCartStates>(
    builder: (context,state) {
    if (state is PutSuccessState) {
    return Row(
    children: [
    GestureDetector(
    onTap: () {
      print('====================###########$newAdding');
      print('====================###########$newValue');

      newAdding++;
    addAmount.add(PutAmountEvent(
    id: widget.id, amount: newValue));
    setState(() {
      newValue++;
      widget.totalPrice * newValue;
    });
    },
    child: const Padding(
    padding: EdgeInsetsDirectional.only(top: 5),
    child: Stack(
    alignment: Alignment.center,
    children: [
    AppImage(url: "Rectangle_plus.png",
    height: 45, width: 50),
    AppImage(url: "Icon_add.png",
    height: 15, width: 15, fit: BoxFit.fill),
    ],
    ),
    ),
    ),
    Text('$newValue'),
    GestureDetector(
    onTap: () {
      print('====================###########$newAdding');
      print('====================###########$newValue');
      newAdding--;
    addAmount.add(PutAmountEvent(
    id: widget.id, amount: newValue));
    setState(() {
      newValue--;
    widget.totalPrice * newValue;
    });
    },
    child: const Padding(
    padding: EdgeInsetsDirectional.only(top: 5),
    child: Stack(
    alignment: Alignment.center,
    children: [
    AppImage(url: "Rectangle_plus.png",
    height: 50, width: 50),
    AppImage(url: "Icon_minus.png",
    height: 15, width: 15, fit: BoxFit.fill),
    ],
    ),
    ),
    ),
    ]);
    }return SizedBox();
    }

    ,

    )
        ]);
  }
}