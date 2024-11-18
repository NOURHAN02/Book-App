import 'package:book_app/Core/Widget/Customer_error.dart';
import 'package:book_app/Core/utils/styles.dart';
import 'package:book_app/Features/home/presentation/manager/feature_cubit/feature_cubit.dart';
import 'package:book_app/Features/home/presentation/manager/feature_cubit/feature_cubit_states.dart';
import 'package:book_app/Features/home/presentation/view/widget/Customer_Image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerListBook extends StatelessWidget {
  const CustomerListBook({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureCubit, FeatureStates>(
      builder: (context, state) {
        if (state is SuccessFeatureStates) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.book.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: BookItemList(
                    book:
                        state.book[index]
                  ),
                );
              },
            ),
          );
        } else if (state is FailureFeatureStates) {
          return CustomerError(errorMessage: state.errorMassage);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
