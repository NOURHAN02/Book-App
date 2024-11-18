import 'package:book_app/Core/utils/styles.dart';
import 'package:book_app/Features/search/presentation/manager/fetch_search/fetch_search_cubit.dart';
import 'package:book_app/Features/search/presentation/manager/fetch_search/fetch_search_states.dart';
import 'package:book_app/Features/search/presentation/view/widget/result-search_book.dart';
import 'package:flutter/material.dart';
import 'customer_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(18.0),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: CustomerTextField(),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        "Search Result", style: Styles.textStyle18)),
                SizedBox(
                  height: 20,
                ),

              ],
            ),
          ),
          SliverToBoxAdapter(child: ResultSearchBook(),)
        ],
      ),
    );
  }
}
