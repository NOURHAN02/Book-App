import 'package:book_app/Core/utils/service_api.dart';
import 'package:book_app/Features/home/data/repos/home_repo_imp.dart';
import 'package:book_app/Features/home/presentation/manager/feature_cubit/feature_cubit.dart';
import 'package:book_app/Features/home/presentation/manager/newSet-cubit/newset_cubit.dart';
import 'package:book_app/Features/home/presentation/view/home_view.dart';
import 'package:book_app/contanst.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeatureCubit(
            HomeRepoImp(
              ServiceAPi(
                Dio(),
              ),
            ),
          )..fetchFeatureBook(),
        ),
        BlocProvider(
          create: (context) => NewSetCubit(
            HomeRepoImp(
              ServiceAPi(
                Dio(),
              ),
            ),
          )..fetchNewSetBook(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
        ),
        home: const HomeView(),
      ),
    );
  }
}
