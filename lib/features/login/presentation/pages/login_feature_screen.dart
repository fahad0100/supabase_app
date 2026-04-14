import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_app/core/extensions/context_extensions.dart';
import 'package:supabase_app/core/navigation/routers.dart';
import 'package:supabase_app/core/widgets/buttons/custom_button.dart';
import 'package:supabase_app/core/widgets/field/custom_field.dart';
import 'package:supabase_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:supabase_app/features/login/presentation/cubit/login_state.dart';

class LoginFeatureScreen extends HookWidget {
  const LoginFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Login Feature Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            context.hideLoading();
            switch (state) {
              case LoginLoadingState _:
                context.showLoading();
                break;
              case LoginSuccessState _:
                context.go(Routes.home);
                break;
              case LoginErrorState _:
                context.showSnackBar(state.message, isError: true);
                break;

              default:
            }
          },
          child: Column(
            children: [
              CustomField(controller: emailController, title: "Email"),
              CustomField(controller: passwordController, title: "Password"),
              CustomButtons(
                title: "Create Account",
                onPressed: () {
                  cubit.getLoginMethod(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
