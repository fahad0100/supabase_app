// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_app/core/services/local_keys_service.dart' as _i828;
import 'package:supabase_app/features/add_post/data/datasources/add_post_remote_data_source.dart'
    as _i108;
import 'package:supabase_app/features/add_post/data/repositories/add_post_repository_data.dart'
    as _i144;
import 'package:supabase_app/features/add_post/domain/repositories/add_post_repository_domain.dart'
    as _i768;
import 'package:supabase_app/features/add_post/domain/use_cases/add_post_use_case.dart'
    as _i707;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initAddPost({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i108.BaseAddPostRemoteDataSource>(
      () => _i108.AddPostRemoteDataSource(
        gh<_i828.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i768.AddPostRepositoryDomain>(
      () =>
          _i144.AddPostRepositoryData(gh<_i108.BaseAddPostRemoteDataSource>()),
    );
    gh.lazySingleton<_i707.AddPostUseCase>(
      () => _i707.AddPostUseCase(gh<_i768.AddPostRepositoryDomain>()),
    );
    return this;
  }
}
