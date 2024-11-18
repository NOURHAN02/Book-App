import 'package:book_app/Core/utils/styles.dart';
import 'package:book_app/Features/home/data/model/BookModel.dart';
import 'package:book_app/Features/home/presentation/view/details_home_view.dart';
import 'package:book_app/Features/home/presentation/view/widget/rating.dart';
import 'package:book_app/contanst.dart';
import 'package:flutter/material.dart';
import 'Customer_Image.dart';

class CustomerItemBestSeller extends StatelessWidget {
  const CustomerItemBestSeller({
    super.key,
    required this.book,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  DetailsHomeView(bookModel: book,)));
      },
      child: Row(
        children: [
          SizedBox(
            height: 130,
            width: 90,
            child: BookItemList(book: book),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.volumeInfo!.title ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle20.copyWith(fontFamily: kGtSectraFine),
                ),
                const SizedBox(
                  height: 3,
                ),
                for (var item in book.volumeInfo!.authors!)
                  Text(
                    item,
                    // authors[0],
                    style: Styles.textStyle14,
                  ),
                Row(
                  children: [
                    Text(
                      "Free",
                      style: Styles.textStyle20
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                     Padding(
                       padding: const EdgeInsets.only(right: 10.0),
                       child: Rating(
                        mainAxisAlignment: MainAxisAlignment.end, rating:book.volumeInfo!.averageRating ?? 0 , count: book.volumeInfo!.ratingsCount ??0,
                                           ),
                     ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
