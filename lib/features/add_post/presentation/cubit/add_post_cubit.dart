import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_app/features/add_post/domain/use_cases/add_post_use_case.dart';
import 'package:supabase_app/features/add_post/presentation/cubit/add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  final AddPostUseCase _addPostUseCase;

  AddPostCubit(this._addPostUseCase) : super(AddPostInitialState());

  Future<void> getAddPostMethod() async {
    final result = await _addPostUseCase.getAddPost();
    result.when(
      (success) {
        //here is when success result
      },
      (whenError) {
       //here is when error result
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
