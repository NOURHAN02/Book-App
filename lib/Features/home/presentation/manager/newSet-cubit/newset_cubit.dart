import 'package:book_app/Features/home/data/repos/home_repo_imp.dart';
import 'package:book_app/Features/home/presentation/manager/newSet-cubit/newset_book_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewSetCubit extends Cubit<NewSetBookStates> {
  NewSetCubit(this.homeRepoImp) : super(InitialStates());
  final HomeRepoImp homeRepoImp;
  Future<void> fetchNewSetBook() async {
    emit(LoadingNewSetStates());
    var result = await homeRepoImp.fetchNewSetBooks();
    result.fold((failure) {
      emit(FailureNewSetStates(failure.errorMessage));
    }, (book) {
      print("Sucess data : ${book.length}******");
      emit(SuccessNewSetStates(book));
    });
  }
}
