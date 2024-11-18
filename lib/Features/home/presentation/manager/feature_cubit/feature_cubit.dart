import 'package:book_app/Features/home/data/repos/home_repo_imp.dart';
import 'package:book_app/Features/home/presentation/manager/feature_cubit/feature_cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureCubit extends Cubit<FeatureStates> {
  FeatureCubit(this.homeRepoImp) : super(InitialStates());
  final HomeRepoImp homeRepoImp;
  Future<void> fetchFeatureBook() async {
    emit(LoadingFeatureStates());
    var result = await homeRepoImp.fetchFeatureBook();
    result.fold((failure) {
      emit(FailureFeatureStates(failure.errorMessage));
    }, (book) {
      print("the book Suceess::${book.length}");
      emit(SuccessFeatureStates(book));
    });
  }
}
