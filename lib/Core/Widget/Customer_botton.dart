import 'package:flutter/material.dart';

class CustomerBotton extends StatelessWidget {
  const CustomerBotton({super.key, required this.color, required this.bottonText, required this.borderRadius, required this.textStyle, this.onPressed});
final Color color;
final String bottonText;
final BorderRadiusGeometry borderRadius;
final TextStyle textStyle;
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(150, 50),
        backgroundColor: color,
        shape:  RoundedRectangleBorder(
          borderRadius:borderRadius,
        ),
      ),
        onPressed: onPressed, child:  Text(bottonText,style:textStyle ,),);
  }
}