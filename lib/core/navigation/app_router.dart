import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'routers.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_app/features/home/presentation/pages/home_feature_screen.dart';
import 'package:supabase_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:supabase_app/features/sign_up/presentation/pages/sign_up_feature_screen.dart';
import 'package:supabase_app/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:supabase_app/features/login/presentation/pages/login_feature_screen.dart';
import 'package:supabase_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:supabase_app/features/add_post/presentation/pages/add_post_feature_screen.dart';
import 'package:supabase_app/features/add_post/presentation/cubit/add_post_cubit.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.login,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) {
          return Scaffold(body: Center(child: Text("splash screen")));
        }, // SplashScreen
      ),

      GoRoute(
        path: Routes.home,
        builder: (context, state) => BlocProvider(
          create: (context) => HomeCubit(GetIt.I.get()),
          child: const HomeFeatureScreen(),
        ),
      ),

      GoRoute(
        path: Routes.signUp,
        builder: (context, state) => BlocProvider(
          create: (context) => SignUpCubit(GetIt.I.get()),
          child: const SignUpFeatureScreen(),
        ),
      ),

      GoRoute(
        path: Routes.login,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(GetIt.I.get()),
          child: const LoginFeatureScreen(),
        ),
      ),

      GoRoute(
        path: Routes.addPost,
        builder: (context, state) => BlocProvider(
          create: (context) => AddPostCubit(GetIt.I.get()),
          child: const AddPostFeatureScreen(),
        ),
      ),
    ],

    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
}
