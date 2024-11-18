import 'package:book_app/Core/function/send_title.dart';
import 'package:book_app/Features/search/presentation/manager/fetch_search/fetch_search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerTextField extends StatelessWidget {
  const CustomerTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (query) {
        BlocProvider.of<SearchCubit>(context).tittleSearch = query;
        BlocProvider.of<SearchCubit>(context).fetchSearchBook1();
      },
      cursorColor: Colors.white,
      decoration: InputDecoration(
        labelText: "Search",
        labelStyle: const TextStyle(color: Colors.white),
        hintText: "Search",
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
