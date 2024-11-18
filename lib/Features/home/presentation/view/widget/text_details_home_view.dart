import 'package:book_app/Core/utils/styles.dart';
import 'package:book_app/Features/home/data/model/BookModel.dart';
import 'package:book_app/Features/home/presentation/view/widget/rating.dart';
import 'package:book_app/contanst.dart';
import 'package:flutter/material.dart';

class TextInDetailsBody extends StatelessWidget {
  const TextInDetailsBody({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          book.volumeInfo!.title ?? "",
          textAlign: TextAlign.center,
          style: Styles.textStyle30.copyWith(fontFamily: kGtSectraFine),
        ),
        for (var item in book.volumeInfo!.authors!)
        Text(item,
          textAlign: TextAlign.center,
          style: Styles.textStyle20.copyWith(color: Colors.white70),
        ),
        const SizedBox(
          height: 10,
        ),
        Rating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: book.volumeInfo!.averageRating ?? 0,
          count: book.volumeInfo!.ratingsCount ?? 0,
        ),
      ],
    );
  }
}
