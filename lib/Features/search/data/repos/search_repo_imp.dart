import 'package:book_app/Core/errore/Failure.dart';
import 'package:book_app/Core/utils/service_api.dart';
import 'package:book_app/Features/home/data/model/BookModel.dart';
import 'package:book_app/Features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImp implements SearchRepo {
  final ServiceAPi serviceAPi;
  SearchRepoImp(this.serviceAPi);
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBook({required String title}) async {
    try {
      var data = await serviceAPi.get(endPoint: "volumes?Filtering=free-ebooks&q=intitle:$title");
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
