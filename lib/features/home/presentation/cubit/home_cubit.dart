import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_app/features/home/domain/use_cases/home_use_case.dart';
import 'package:supabase_app/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeUseCase _homeUseCase;

  HomeCubit(this._homeUseCase) : super(HomeInitialState()) {
    getHomeMethod();
  }

  Future<void> getHomeMethod() async {
    emit(HomeInitialState());

    final result = await _homeUseCase.getHome();
    result.when(
      (success) {
        emit(HomeSuccessState(posts: success.posts));
      },
      (whenError) {
        emit(HomeErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
