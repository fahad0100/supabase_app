import 'package:multiple_result/multiple_result.dart';
import 'package:supabase_app/core/errors/failure.dart';
import 'package:supabase_app/features/profile/domain/entities/profile_entity.dart';

abstract class ProfileRepositoryDomain {
    Future<Result<ProfileEntity, Failure>> getProfile();
}
