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
import 'package:supabase_app/core/services/profile_service.dart' as _i964;
import 'package:supabase_app/features/loading/data/datasources/loading_remote_data_source.dart'
    as _i218;
import 'package:supabase_app/features/loading/data/repositories/loading_repository_data.dart'
    as _i602;
import 'package:supabase_app/features/loading/domain/repositories/loading_repository_domain.dart'
    as _i415;
import 'package:supabase_app/features/loading/domain/use_cases/loading_use_case.dart'
    as _i472;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initLoading({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i218.BaseLoadingRemoteDataSource>(
      () => _i218.LoadingRemoteDataSource(
        gh<_i828.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
        gh<_i964.ProfileService>(),
      ),
    );
    gh.lazySingleton<_i415.LoadingRepositoryDomain>(
      () =>
          _i602.LoadingRepositoryData(gh<_i218.BaseLoadingRemoteDataSource>()),
    );
    gh.lazySingleton<_i472.LoadingUseCase>(
      () => _i472.LoadingUseCase(gh<_i415.LoadingRepositoryDomain>()),
    );
    return this;
  }
}
