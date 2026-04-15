import 'package:injectable/injectable.dart';
import 'package:supabase_app/core/services/profile_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_app/features/add_post/data/models/add_post_model.dart';
import 'package:supabase_app/core/errors/network_exceptions.dart';

abstract class BaseAddPostRemoteDataSource {
  Future<AddPostModel> getAddPost({required String content});
}

@LazySingleton(as: BaseAddPostRemoteDataSource)
class AddPostRemoteDataSource implements BaseAddPostRemoteDataSource {
  final SupabaseClient _supabase;
  final ProfileService _profileService;

  AddPostRemoteDataSource(this._profileService, this._supabase);

  @override
  Future<AddPostModel> getAddPost({required String content}) async {
    try {
      final dataPost = {
        "content": content,
        "user_id": _profileService.profile!.id,
      };

      await _supabase.from('post').insert(dataPost);
      return AddPostModel(
        id: 1,
        firstName: "Last Name",
        lastName: "First Name",
      );
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
