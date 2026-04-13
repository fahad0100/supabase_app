import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:supabase_app/core/extensions/context_extensions.dart';
import 'package:supabase_app/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:supabase_app/features/sign_up/presentation/cubit/sign_up_state.dart';

class SignUpFeatureScreen extends HookWidget {
  const SignUpFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('SignUp Feature Screen')),
      body: BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state) {
          context.hideLoading();
          switch (state) {
            case SignUpLoadingState _:
              context.showLoading();

              break;
            case SignUpSuccessState _:
              context.showSnackBar("Login Done", isError: false);

              break;
            case SignUpErrorState _:
              context.showSnackBar(state.message, isError: true);
              break;
            default:
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              Column(
                crossAxisAlignment: .start,
                children: [
                  Text("Email"),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: .start,
                children: [
                  Text("Password"),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  cubit.getSignUpMethod(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                },
                child: Text("Create Account"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
