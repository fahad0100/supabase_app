import 'package:injectable/injectable.dart';
import 'package:supabase_app/core/errors/network_exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseSignUpRemoteDataSource {
  Future<bool> getSignUp({
    required String email,
    required String password,
    required String fullName,
    required String ambition,
    required String phone,
  });
}

@LazySingleton(as: BaseSignUpRemoteDataSource)
class SignUpRemoteDataSource implements BaseSignUpRemoteDataSource {
  final SupabaseClient _supabase;
  SignUpRemoteDataSource(this._supabase);

  @override
  Future<bool> getSignUp({
    required String email,
    required String password,
    required String fullName,
    required String ambition,
    required String phone,
  }) async {
    final dataAuthUser = await _supabase.auth.signUp(
      password: password,
      email: email,
    );
    await _supabase.from('profile').insert({
      "id": dataAuthUser.user!.id,
      "phone": '966$phone',
      "auth_id": dataAuthUser.user!.id,
      "ambition": ambition,
      "full_name": fullName,
      "email": email,
    });
    return true;
  }
}
//ghayd25@outlook.sa