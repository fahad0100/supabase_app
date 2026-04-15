import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_app/core/extensions/context_extensions.dart';
import 'package:supabase_app/core/navigation/routers.dart';
import 'package:supabase_app/core/widgets/loading_widget.dart';
import 'package:supabase_app/features/loading/presentation/cubit/loading_cubit.dart';
import 'package:supabase_app/features/loading/presentation/cubit/loading_state.dart';

class LoadingFeatureScreen extends StatelessWidget {
  const LoadingFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final _ = context.read<LoadingCubit>();

    return Scaffold(
      body: BlocListener<LoadingCubit, LoadingState>(
        listener: (context, state) {
          switch (state) {
            case LoadingSuccessState _:
              if (state.isLogin) {
                context.go(Routes.home);
              } else {
                context.go(Routes.login);
              }

              break;

            case LoadingErrorState _:
              context.showSnackBar(state.message);
              context.go(Routes.login);
              break;

            default:
               context.go(Routes.login);
          }
        },
        child: LoadingWidget(),
      ),
    );
  }
}
