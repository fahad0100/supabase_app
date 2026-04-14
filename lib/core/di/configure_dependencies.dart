import 'package:get_it/get_it.dart';
import 'package:supabase_app/core/di/configure_dependencies.config.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_app/features/home/di/home_di.dart';
import 'package:supabase_app/features/sign_up/di/sign_up_di.dart';
import 'package:supabase_app/features/login/di/login_di.dart';
import 'package:supabase_app/features/add_post/di/add_post_di.dart';

@InjectableInit(
  initializerName: 'init', 
  preferRelativeImports: true,
  asExtension: true, 
  generateForDir: ['lib/core'],
)

Future<void> configureDependencies() async {
  final getIt = GetIt.instance;
  getIt.init();
    configureHome(getIt);
    configureSignUp(getIt);
    configureLogin(getIt);
    configureAddPost(getIt);
}
