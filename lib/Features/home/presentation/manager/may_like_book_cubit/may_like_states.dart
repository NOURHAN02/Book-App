import 'package:book_app/Features/home/data/model/BookModel.dart';

abstract class MayLikeStates{}
class InitialState extends MayLikeStates{}
class LoadingMayLikeState extends MayLikeStates{}
class SuccessMayLikeState extends MayLikeStates{
  final List<BookModel>book;

  SuccessMayLikeState(this.book);

}
class FailureMayLikeState extends MayLikeStates{
  final String errorMessage;
  FailureMayLikeState(this.errorMessage);
}