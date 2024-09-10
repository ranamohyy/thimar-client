import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      decoration:const InputDecoration(
        hintText: ("ابحث عن ماتريد؟"),
        prefixIcon:Icon( Icons.search),),);
  }
}
