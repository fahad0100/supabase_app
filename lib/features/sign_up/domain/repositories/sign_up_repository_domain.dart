import 'package:multiple_result/multiple_result.dart';
import 'package:supabase_app/core/errors/failure.dart';

abstract class SignUpRepositoryDomain {
  Future<Result<bool, Failure>> getSignUp({
    required String email,
    required String password,
    required String fullName,
    required String ambition,
    required String phone,
  });
}
