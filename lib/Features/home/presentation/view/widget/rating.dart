import 'package:book_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
 const Rating({super.key,required this.mainAxisAlignment, required this.rating, required this.count});
  final MainAxisAlignment mainAxisAlignment;
  final num rating;
  final num count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.star,
          color: Colors.yellowAccent,
        ),
        const SizedBox(
          width: 3,
        ),
         Text(
          "$rating ",
          style: Styles.textStyle16,
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          "($count)",
          style: Styles.textStyle14.copyWith(color: Colors.grey),
        )
      ],
    );
  }
}