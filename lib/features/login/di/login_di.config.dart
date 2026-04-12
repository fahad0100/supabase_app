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
import 'package:supabase_app/features/login/data/datasources/login_remote_data_source.dart'
    as _i785;
import 'package:supabase_app/features/login/data/repositories/login_repository_data.dart'
    as _i376;
import 'package:supabase_app/features/login/domain/repositories/login_repository_domain.dart'
    as _i525;
import 'package:supabase_app/features/login/domain/use_cases/login_use_case.dart'
    as _i580;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initLogin({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i785.BaseLoginRemoteDataSource>(
      () => _i785.LoginRemoteDataSource(
        gh<_i828.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i525.LoginRepositoryDomain>(
      () => _i376.LoginRepositoryData(gh<_i785.BaseLoginRemoteDataSource>()),
    );
    gh.lazySingleton<_i580.LoginUseCase>(
      () => _i580.LoginUseCase(gh<_i525.LoginRepositoryDomain>()),
    );
    return this;
  }
}
