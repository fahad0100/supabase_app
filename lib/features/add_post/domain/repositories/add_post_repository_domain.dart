import 'package:multiple_result/multiple_result.dart';
import 'package:supabase_app/core/errors/failure.dart';
import 'package:supabase_app/features/add_post/domain/entities/add_post_entity.dart';

abstract class AddPostRepositoryDomain {
  Future<Result<AddPostEntity, Failure>> getAddPost({required String content});
}
