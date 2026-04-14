import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_app/core/services/local_keys_service.dart';
import 'package:supabase_app/features/add_post/data/models/add_post_model.dart';
import 'package:supabase_app/core/errors/network_exceptions.dart';


abstract class BaseAddPostRemoteDataSource {
  Future<AddPostModel> getAddPost();
}


@LazySingleton(as: BaseAddPostRemoteDataSource)
class AddPostRemoteDataSource implements BaseAddPostRemoteDataSource {
 
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  
  

   AddPostRemoteDataSource(this._localKeysService, this._supabase);



    @override
  Future<AddPostModel> getAddPost() async {
    try {
      return AddPostModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
     throw FailureExceptions.getException(error);
    }
  }
}
