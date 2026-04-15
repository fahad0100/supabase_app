import 'package:injectable/injectable.dart';
import 'package:supabase_app/core/common/models/profile_model.dart';
import 'package:supabase_app/core/services/profile_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_app/core/services/local_keys_service.dart';
import 'package:supabase_app/features/loading/data/models/loading_model.dart';
import 'package:supabase_app/core/errors/network_exceptions.dart';

abstract class BaseLoadingRemoteDataSource {
  Future<LoadingModel> getLoading();
}

@LazySingleton(as: BaseLoadingRemoteDataSource)
class LoadingRemoteDataSource implements BaseLoadingRemoteDataSource {
  final SupabaseClient _supabase;
  final ProfileService _profile;
  final LocalKeysService _localKeysService;

  LoadingRemoteDataSource(
    this._localKeysService,
    this._supabase,
    this._profile,
  );

  @override
  Future<LoadingModel> getLoading() async {
    try {
      final userToken = _supabase.auth.currentSession?.accessToken;
      final isLogin = userToken != null;
      final isExpired = _supabase.auth.currentSession?.isExpired ?? true;

      if (isLogin && !isExpired) {
        final userData = await _supabase
            .from('profile')
            .select()
            .eq('id', _supabase.auth.currentUser!.id)
            .single();
        final userModel = ProfileModel.fromJson(userData);
        _profile.setProfile = userModel;
        return LoadingModel(isLogin: true);
      }
      return LoadingModel(isLogin: false);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
