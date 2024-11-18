import 'package:book_app/Core/utils/service_api.dart';
import 'package:book_app/Features/home/data/model/BookModel.dart';
import 'package:book_app/Features/home/data/repos/home_repo_imp.dart';
import 'package:book_app/Features/home/presentation/manager/may_like_book_cubit/may_like_cubit.dart';
import 'package:book_app/Features/home/presentation/view/widget/details_home_body.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsHomeView extends StatelessWidget {
  const DetailsHomeView({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MayLikeBookCubit(HomeRepoImp(ServiceAPi(Dio())))
        ..fetchMayLikeBook(
          category: (bookModel.volumeInfo?.categories?.isNotEmpty ?? false)
              ? bookModel.volumeInfo?.categories![0]
              : "home"

        ),

      child: Scaffold(
        body: SafeArea(
          child: DetailsHomeBody(
            book: bookModel,
          ),
        ),
      ),
    );
  }
}
