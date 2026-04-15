import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_app/core/services/local_keys_service.dart';
import 'package:supabase_app/features/home/data/models/post_model.dart';
import 'package:supabase_app/core/errors/network_exceptions.dart';

abstract class BaseHomeRemoteDataSource {
  Future<List<PostModel>> getHome();
}

@LazySingleton(as: BaseHomeRemoteDataSource)
class HomeRemoteDataSource implements BaseHomeRemoteDataSource {
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;

  HomeRemoteDataSource(this._localKeysService, this._supabase);

  @override
  Future<List<PostModel>> getHome() async {
    try {
      final postLoaded = await _supabase.from('post').select();
      return postLoaded.map((item) => PostModel.fromJson(item)).toList();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
