import 'package:book_app/Features/home/data/model/BookModel.dart';

abstract class NewSetBookStates {}

class InitialStates extends NewSetBookStates {}

class LoadingNewSetStates extends NewSetBookStates {}

class SuccessNewSetStates extends NewSetBookStates {
  final List<BookModel> book;

  SuccessNewSetStates(this.book);
}

class FailureNewSetStates extends NewSetBookStates {
  final String errorMassage;

  FailureNewSetStates(this.errorMassage);
}
