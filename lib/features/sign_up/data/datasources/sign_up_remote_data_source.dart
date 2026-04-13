import 'package:injectable/injectable.dart';
import 'package:supabase_app/core/errors/network_exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseSignUpRemoteDataSource {
  Future<bool> getSignUp({required String email, required String password});
}

@LazySingleton(as: BaseSignUpRemoteDataSource)
class SignUpRemoteDataSource implements BaseSignUpRemoteDataSource {
  final SupabaseClient _supabase;
  SignUpRemoteDataSource(this._supabase);

  @override
  Future<bool> getSignUp({
    required String email,
    required String password,
  }) async {
    try {
      await _supabase.auth.signUp(password: password, email: email);
      return true;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
//ghayd25@outlook.sa