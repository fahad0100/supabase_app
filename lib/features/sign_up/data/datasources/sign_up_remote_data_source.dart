import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_app/core/services/local_keys_service.dart';
import 'package:supabase_app/features/sign_up/data/models/sign_up_model.dart';
import 'package:supabase_app/core/errors/network_exceptions.dart';

abstract class BaseSignUpRemoteDataSource {
  Future<SignUpModel> getSignUp({
    required String email,
    required String password,
  });
}

@LazySingleton(as: BaseSignUpRemoteDataSource)
class SignUpRemoteDataSource implements BaseSignUpRemoteDataSource {
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;

  SignUpRemoteDataSource(this._localKeysService, this._supabase);

  @override
  Future<SignUpModel> getSignUp({
    required String email,
    required String password,
  }) async {
    try {
      final userCreated = await _supabase.auth.signUp(
        password: password,
        email: email,
      );
      await _supabase.from('users').insert({
        "id": userCreated.user!.id,
        "name": "asdfasdf",
        "email": email,
      });
      return SignUpModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
//ghayd25@outlook.sa