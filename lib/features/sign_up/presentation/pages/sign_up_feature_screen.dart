import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_app/core/extensions/context_extensions.dart';
import 'package:supabase_app/core/navigation/routers.dart';
import 'package:supabase_app/core/utils/validators.dart';
import 'package:supabase_app/core/widgets/buttons/custom_button.dart';
import 'package:supabase_app/core/widgets/field/custom_field.dart';
import 'package:supabase_app/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:supabase_app/features/sign_up/presentation/cubit/sign_up_state.dart';

class SignUpFeatureScreen extends HookWidget {
  const SignUpFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    final fullNameController = useTextEditingController();
    final ambitionController = useTextEditingController();
    final emailController = useTextEditingController();
    final phoneController = useTextEditingController();
    final passwordController = useTextEditingController();

    final keyField = GlobalKey<FormState>();

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
              context.go(Routes.login);

              break;
            case SignUpErrorState _:
              context.showSnackBar(state.message, isError: true);
              break;
            default:
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: keyField,
            child: Column(
              spacing: 16,
              children: [
                CustomField(
                  controller: fullNameController,

                  title: "Full name",
                  validator: Validators.validateFullName,
                ),
                CustomField(
                  controller: ambitionController,
                  title: "Ambition",
                  validator: Validators.validateRequired,
                ),
                CustomField(
                  controller: emailController,
                  title: "Email",
                  validator: Validators.validateEmail,
                ),
                CustomField(
                  controller: phoneController,
                  title: "Phone",
                  validator: Validators.validatePhone,
                ),
                CustomField(
                  controller: passwordController,
                  title: "Password",
                  validator: Validators.validatePassword,
                ),
                CustomButtons(
                  title: "Create Account",
                  onPressed: () {
                    if (!keyField.currentState!.validate()) {
                      return;
                    }

                    cubit.getSignUpMethod(
                      email: emailController.text,
                      password: passwordController.text,
                      ambition: ambitionController.text,
                      fullName: fullNameController.text,
                      phone: phoneController.text,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
