import 'package:book_app/Core/Widget/Customer_circle.dart';
import 'package:book_app/Core/Widget/Customer_error.dart';
import 'package:book_app/Core/utils/service_api.dart';
import 'package:book_app/Features/home/data/repos/home_repo_imp.dart';
import 'package:book_app/Features/home/presentation/manager/may_like_book_cubit/may_like_cubit.dart';
import 'package:book_app/Features/home/presentation/manager/may_like_book_cubit/may_like_states.dart';
import 'package:book_app/Features/home/presentation/view/widget/Customer_Image.dart';
import 'package:book_app/Features/home/presentation/view/widget/customer_item_list_may_like.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerListMayLike extends StatelessWidget {
  const CustomerListMayLike({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MayLikeBookCubit, MayLikeStates>(
      builder: (context, state) {
        if (state is SuccessMayLikeState) {
          return SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * .17,
            child: ListView.builder(
              itemCount: state.book.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return  Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 4.0),
                    child: BookItemList(book: state.book[index]),
                  );
                }
            ),
          );
        } else if (state is FailureMayLikeState) {
          return CustomerError(errorMessage: state.errorMessage);
        } else {
          return const CustomerCircle();
        }
      },
    );
  }
}
