import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_app/core/services/local_keys_service.dart';
import 'package:supabase_app/features/home/data/models/home_model.dart';
import 'package:supabase_app/core/errors/network_exceptions.dart';

abstract class BaseHomeRemoteDataSource {
  Future<HomeModel> getHome();
}

@LazySingleton(as: BaseHomeRemoteDataSource)
class HomeRemoteDataSource implements BaseHomeRemoteDataSource {
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;

  HomeRemoteDataSource(this._localKeysService, this._supabase);

  @override
  Future<HomeModel> getHome() async {
    try {
      await _supabase.from('test_table').insert({
        "id": "8d888d6kitw",
        "name": "dkajsdf",
        "email": "ddddd",
      }).select();
      return HomeModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
