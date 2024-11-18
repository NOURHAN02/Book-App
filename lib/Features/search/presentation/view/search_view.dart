import 'package:book_app/Core/utils/service_api.dart';
import 'package:book_app/Features/search/data/repos/search_repo_imp.dart';
import 'package:book_app/Features/search/presentation/manager/fetch_search/fetch_search_cubit.dart';
import 'package:book_app/Features/search/presentation/view/widget/search_view_body.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(
        SearchRepoImp(
          ServiceAPi(
            Dio(),
          ),
        ),
      )..fetchSearchBook1(),
      child: const Scaffold(
        body: SafeArea(
          child: SearchViewBody(),
        ),
      ),
    );
  }
}
