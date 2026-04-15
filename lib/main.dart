import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/setup.dart';
import 'core/theme/app_theme.dart';
import 'core/di/configure_dependencies.dart';
import 'core/navigation/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  await setup();
  await configureDependencies();
  // await GetIt.I.get<SupabaseClient>().auth.signOut(scope: .global);
  // await GetIt.I.get<SupabaseClient>().auth.signOut(scope: .local);

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return MaterialApp.router(
          routerConfig: AppRouter.router,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          // themeMode: state.themeMode,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          debugShowCheckedModeBanner: true,
        );
      },
    );
  }
}
