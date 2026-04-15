import 'package:multiple_result/multiple_result.dart';
import 'package:supabase_app/core/common/entity/profile_entity.dart';
import 'package:supabase_app/core/errors/failure.dart';

abstract class ProfileRepositoryDomain {
  Future<Result<ProfileEntity, Failure>> getProfile();
}
