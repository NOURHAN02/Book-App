import 'package:book_app/Features/home/data/model/BookModel.dart';

abstract class SearchStates{}
class InitialSearchState extends SearchStates{}
class LoadingSearchState extends SearchStates{}
class SuccessSearchState extends SearchStates{
  final List<BookModel>book;

  SuccessSearchState(this.book);

}
class FailureSearchState extends SearchStates{
  final String errorMessage;

  FailureSearchState(this.errorMessage);

}
