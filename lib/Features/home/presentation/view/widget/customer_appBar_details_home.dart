import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomerAppBarDetailsHome extends StatelessWidget {
  const CustomerAppBarDetailsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            icon: const FaIcon(
              FontAwesomeIcons.xmark,
              size: 24,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        const Spacer(),
        IconButton(
            icon: const FaIcon(
              Icons.shopping_cart_outlined,
              size: 24,
            ),
            onPressed: () {}),
      ],
    );
  }
}