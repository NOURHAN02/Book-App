import 'package:book_app/Core/errore/Failure.dart';
import 'package:book_app/Features/home/data/model/BookModel.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo{
  Future<Either<Failure,List<BookModel>>>fetchSearchBook({required String  title});
}
