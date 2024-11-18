import 'package:book_app/Core/errore/Failure.dart';
import 'package:book_app/Features/home/data/model/BookModel.dart';
import 'package:dartz/dartz.dart';
abstract class HomeRepo{
 Future<Either<Failure, List<BookModel>>> fetchNewSetBooks();
 Future <Either<Failure,List<BookModel>>>fetchFeatureBook();
 Future <Either<Failure,List<BookModel>>>fetchMayLikeBook({required String category });
}