import 'package:multiple_result/multiple_result.dart';
import 'package:supabase_app/core/errors/failure.dart';
import 'package:supabase_app/features/login/domain/entities/login_entity.dart';

abstract class LoginRepositoryDomain {
    Future<Result<LoginEntity, Failure>> getLogin();
}
