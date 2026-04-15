import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_app/core/errors/failure.dart';
import 'package:supabase_app/features/add_post/domain/entities/add_post_entity.dart';
import 'package:supabase_app/features/add_post/domain/repositories/add_post_repository_domain.dart';


@lazySingleton
class AddPostUseCase {
  final AddPostRepositoryDomain _repositoryData;

  AddPostUseCase(this._repositoryData);

   Future<Result<AddPostEntity, Failure>> getAddPost({required String content}) async {
    return _repositoryData.getAddPost(content: content);
  }
}
