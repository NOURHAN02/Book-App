import 'package:book_app/Core/errore/Failure.dart';
import 'package:book_app/Core/utils/service_api.dart';
import 'package:book_app/Features/home/data/model/BookModel.dart';
import 'package:book_app/Features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImp implements HomeRepo {
  final ServiceAPi serviceAPi;
  HomeRepoImp(this.serviceAPi);
  @override
  Future<Either<Failure, List<BookModel>>> fetchFeatureBook() async {
    try {
      var data = await serviceAPi.get(
          endPoint: "volumes?Filtering=free-ebooks&q=computer%20science");
      List<BookModel> book = [];
      for (var item in data['items']) {
        book.add(BookModel.fromJson(item));
      }
      return right(book);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromjson(e));
      }
      return left(ServerError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewSetBooks() async {
    try {
      var data = await serviceAPi.get(
          endPoint:
              "volumes?Filtering=free-ebooks&Sorting=newest%20&q=computer%20science");
      List<BookModel> book = [];
      for (var item in data['items']) {
        book.add(BookModel.fromJson(item));
      }
      return right(book);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromjson(e));
      }
      return left(ServerError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchMayLikeBook({required category})async {
    try {
      var data = await serviceAPi.get(
          endPoint: "volumes?Filtering=free-ebooks&Sorting=relevance&q=$category");
      List<BookModel> book = [];
      for (var item in data['items']) {
        book.add(BookModel.fromJson(item));
      }
      return right(book);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromjson(e));
      }
      return left(ServerError(e.toString()));
    }
  }
}
