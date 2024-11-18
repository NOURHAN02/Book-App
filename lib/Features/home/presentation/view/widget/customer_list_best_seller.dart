import 'package:book_app/Core/Widget/Customer_circle.dart';
import 'package:book_app/Core/Widget/Customer_error.dart';
import 'package:book_app/Features/home/presentation/manager/newSet-cubit/newset_book_states.dart';
import 'package:book_app/Features/home/presentation/manager/newSet-cubit/newset_cubit.dart';
import 'package:book_app/Features/home/presentation/view/widget/customer_Item_best_seller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerListBestSeller extends StatelessWidget {
  const CustomerListBestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewSetCubit, NewSetBookStates>(
      builder: (context, state) {
        if (state is SuccessNewSetStates) {
          return ListView.builder(
              clipBehavior:Clip.none,
              shrinkWrap: true,
              itemCount: state.book.length,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CustomerItemBestSeller(
                    book: state.book[index],
                  ),
                );
              });
        } else if (state is FailureNewSetStates) {
          return CustomerError(errorMessage: state.errorMassage);
        } else {
          return const CustomerCircle();
        }
      },
    );
  }
}
