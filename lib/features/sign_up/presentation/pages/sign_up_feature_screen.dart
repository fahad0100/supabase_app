import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:supabase_app/features/sign_up/presentation/cubit/sign_up_cubit.dart';

class SignUpFeatureScreen extends HookWidget {
  const SignUpFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('SignUp Feature Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(border: OutlineInputBorder()),
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
    );
  }
}
