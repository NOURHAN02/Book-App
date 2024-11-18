import 'package:book_app/Core/Widget/Customer_error.dart';
import 'package:book_app/Core/utils/styles.dart';
import 'package:book_app/Features/home/data/model/BookModel.dart';
import 'package:book_app/Features/home/presentation/view/widget/botton_action.dart';
import 'package:flutter/material.dart';
import '../../../../../contanst.dart';
import 'Customer_list_may_like.dart';
import 'customer_appBar_details_home.dart';
import 'customer_image_details_view.dart';
import 'text_details_home_view.dart';

class DetailsHomeBody extends StatelessWidget {
  const DetailsHomeBody({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding:const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomerAppBarDetailsHome(),

                Center(
                    child: CustomerImage(
                  imageUrl: book.volumeInfo!.imageLinks?.thumbnail ?? "",
                )),
                const SizedBox(
                  height: 20,
                ),
                TextInDetailsBody(book: book,),
                const SizedBox(
                  height: 20,
                ),
                BottonAction(goTo: book.volumeInfo?.infoLink??"",),
                const Expanded(
                    child: SizedBox(
                  height: 50,
                )),
                const Text(
                  "You can also like",
                  style: Styles.textStyle16,
                ),
                const SizedBox(
                  height: 16,
                ),
               const CustomerListMayLike(),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
