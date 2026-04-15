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
import 'package:supabase_app/features/profile/data/datasources/profile_remote_data_source.dart'
    as _i492;
import 'package:supabase_app/features/profile/data/repositories/profile_repository_data.dart'
    as _i959;
import 'package:supabase_app/features/profile/domain/repositories/profile_repository_domain.dart'
    as _i403;
import 'package:supabase_app/features/profile/domain/use_cases/profile_use_case.dart'
    as _i156;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initProfile({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i492.BaseProfileRemoteDataSource>(
      () => _i492.ProfileRemoteDataSource(
        gh<_i828.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i403.ProfileRepositoryDomain>(
      () =>
          _i959.ProfileRepositoryData(gh<_i492.BaseProfileRemoteDataSource>()),
    );
    gh.lazySingleton<_i156.ProfileUseCase>(
      () => _i156.ProfileUseCase(gh<_i403.ProfileRepositoryDomain>()),
    );
    return this;
  }
}
