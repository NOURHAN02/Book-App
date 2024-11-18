import 'package:book_app/Features/home/data/model/BookModel.dart';

abstract class FeatureStates {}

class InitialStates extends FeatureStates {}

class LoadingFeatureStates extends FeatureStates {}

class SuccessFeatureStates extends FeatureStates {
  final List<BookModel> book;

  SuccessFeatureStates(this.book);
}

class FailureFeatureStates extends FeatureStates {
  final String errorMassage;

  FailureFeatureStates(this.errorMassage);
}
