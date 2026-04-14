import 'package:flutter/material.dart';

class CustomButtons extends StatelessWidget {
  const CustomButtons({super.key, this.onPressed, required this.title});
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(title));
  }
}
