import 'package:book_app/Features/home/presentation/manager/may_like_book_cubit/may_like_states.dart';
import 'package:book_app/Features/search/data/repos/search_repo_imp.dart';
import 'package:book_app/Features/search/presentation/manager/fetch_search/fetch_search_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit(this.searchRepoImp) : super(InitialSearchState());

  final SearchRepoImp searchRepoImp;
  String tittleSearch = "love";
  Future<void> fetchSearchBook1() async {
    emit(LoadingSearchState());
    var result = await searchRepoImp.fetchSearchBook(title: tittleSearch);

    result.fold((failure) {
      emit(FailureSearchState(failure.errorMessage));
    }, (book) {
      emit(SuccessSearchState(book));
    });
  }
}
