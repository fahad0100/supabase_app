import 'package:multiple_result/multiple_result.dart';
import 'package:supabase_app/core/errors/failure.dart';
import 'package:supabase_app/features/sign_up/domain/entities/sign_up_entity.dart';

abstract class SignUpRepositoryDomain {
  Future<Result<SignUpEntity, Failure>> getSignUp({
    required String email,
    required String password,
  });
}
