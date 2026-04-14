import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_app/core/services/local_keys_service.dart';
import 'package:supabase_app/features/login/data/models/login_model.dart';
import 'package:supabase_app/core/errors/network_exceptions.dart';

abstract class BaseLoginRemoteDataSource {
  Future<void> getLogin({required String email, required String password});
}

@LazySingleton(as: BaseLoginRemoteDataSource)
class LoginRemoteDataSource implements BaseLoginRemoteDataSource {
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;

  LoginRemoteDataSource(this._localKeysService, this._supabase);

  @override
  Future<void> getLogin({
    required String email,
    required String password,
  }) async {
    try {
      await _supabase.auth.signInWithPassword(password: password, email: email);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
