import 'package:book_app/Features/home/data/repos/home_repo_imp.dart';
import 'package:book_app/Features/home/presentation/manager/may_like_book_cubit/may_like_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MayLikeBookCubit extends Cubit<MayLikeStates> {
  MayLikeBookCubit(this.homeRepoImp) : super(InitialState());
  final HomeRepoImp homeRepoImp;
  Future<void> fetchMayLikeBook({required dynamic category}) async {
    emit(LoadingMayLikeState());
    var result = await homeRepoImp.fetchMayLikeBook(category: category );
    result.fold((failure) {
      emit(FailureMayLikeState(failure.errorMessage));
    }, (book) {
      emit(SuccessMayLikeState(book));
    });
  }
}
