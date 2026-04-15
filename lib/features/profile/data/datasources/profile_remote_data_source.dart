import 'package:injectable/injectable.dart';
import 'package:supabase_app/core/common/models/profile_model.dart';
import 'package:supabase_app/core/services/profile_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_app/core/errors/network_exceptions.dart';

abstract class BaseProfileRemoteDataSource {
  Future<ProfileModel> getProfile();
}

@LazySingleton(as: BaseProfileRemoteDataSource)
class ProfileRemoteDataSource implements BaseProfileRemoteDataSource {
  final SupabaseClient _supabase;
  final ProfileService _profileService;

  ProfileRemoteDataSource(this._profileService, this._supabase);

  @override
  Future<ProfileModel> getProfile() async {
    try {
      return _profileService.profile!;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
