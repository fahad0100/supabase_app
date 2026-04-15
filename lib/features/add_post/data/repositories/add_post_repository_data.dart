import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:supabase_app/core/errors/network_exceptions.dart';
import 'package:supabase_app/core/errors/failure.dart';
import 'package:supabase_app/features/add_post/domain/entities/add_post_entity.dart';

import 'package:supabase_app/features/add_post/data/datasources/add_post_remote_data_source.dart';
import 'package:supabase_app/features/add_post/data/models/add_post_model.dart';
import 'package:supabase_app/features/add_post/domain/repositories/add_post_repository_domain.dart';

@LazySingleton(as: AddPostRepositoryDomain)
class AddPostRepositoryData implements AddPostRepositoryDomain {
  final BaseAddPostRemoteDataSource remoteDataSource;

  AddPostRepositoryData(this.remoteDataSource);

  @override
  Future<Result<AddPostEntity, Failure>> getAddPost({
    required String content,
  }) async {
    try {
      final response = await remoteDataSource.getAddPost(content: content);
      return Success(response.toEntity());
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
