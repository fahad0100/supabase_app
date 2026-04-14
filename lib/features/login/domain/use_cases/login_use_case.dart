import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_app/core/errors/failure.dart';
import 'package:supabase_app/features/login/domain/entities/login_entity.dart';
import 'package:supabase_app/features/login/domain/repositories/login_repository_domain.dart';

@lazySingleton
class LoginUseCase {
  final LoginRepositoryDomain _repositoryData;

  LoginUseCase(this._repositoryData);

  Future<Result<void, Failure>> getLogin({
    required String email,
    required String password,
  }) async {
    return _repositoryData.getLogin(email: email, password: password);
  }
}
