import 'dart:ffi';

import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:supabase_app/core/errors/network_exceptions.dart';
import 'package:supabase_app/core/errors/failure.dart';
import 'package:supabase_app/features/login/domain/entities/login_entity.dart';

import 'package:supabase_app/features/login/data/datasources/login_remote_data_source.dart';
import 'package:supabase_app/features/login/data/models/login_model.dart';
import 'package:supabase_app/features/login/domain/repositories/login_repository_domain.dart';

@LazySingleton(as: LoginRepositoryDomain)
class LoginRepositoryData implements LoginRepositoryDomain {
  final BaseLoginRemoteDataSource remoteDataSource;

  LoginRepositoryData(this.remoteDataSource);

  @override
  Future<Result<void, Failure>> getLogin({
    required String email,
    required String password,
  }) async {
    try {
      await remoteDataSource.getLogin(email: email, password: password);
      return Success(null);
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
