import 'package:flutter/material.dart';

class AppButtonView extends StatelessWidget {
  final String text;
  final void Function()? onPress;
  const AppButtonView ({super.key,  this.text ="", this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPress, child: Text(text));
  }
}
