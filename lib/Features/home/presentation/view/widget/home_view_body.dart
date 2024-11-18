import 'package:book_app/Core/utils/styles.dart';
import 'package:book_app/Features/home/presentation/manager/newSet-cubit/newset_book_states.dart';
import 'package:book_app/Features/home/presentation/manager/newSet-cubit/newset_cubit.dart';
import 'package:book_app/Features/home/presentation/view/widget/customer_Item_best_seller.dart';
import 'package:book_app/Features/home/presentation/view/widget/customer_app.dart';
import 'package:book_app/Features/home/presentation/view/widget/customer_list_best_seller.dart';
import 'package:book_app/Features/home/presentation/view/widget/customer_list_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
                child: CustomerApp(),
              ),
              CustomerListBook(),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20, bottom: 10),
                child: Text("Best Seller", style: Styles.textStyle18),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: CustomerListBestSeller(),
          ),
        ),
      ],
    );
  }
}
