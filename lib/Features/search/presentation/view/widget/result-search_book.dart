import 'package:book_app/Core/Widget/Customer_circle.dart';
import 'package:book_app/Core/Widget/Customer_error.dart';
import 'package:book_app/Core/utils/service_api.dart';
import 'package:book_app/Features/search/data/repos/search_repo_imp.dart';
import 'package:book_app/Features/search/presentation/manager/fetch_search/fetch_search_cubit.dart';
import 'package:book_app/Features/search/presentation/manager/fetch_search/fetch_search_states.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home/presentation/view/widget/customer_Item_best_seller.dart';

class ResultSearchBook extends StatelessWidget {
  const ResultSearchBook({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchStates>(
      builder: (context, state) {
        if (state is SuccessSearchState) {
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount:state.book.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CustomerItemBestSeller(
                    book: state.book[index],
                  ),
                );
              });
        } else if (state is FailureSearchState) {
          return CustomerError(errorMessage: state.errorMessage);
        } else {
          return const CustomerCircle();
        }
      },
    );
  }
}
