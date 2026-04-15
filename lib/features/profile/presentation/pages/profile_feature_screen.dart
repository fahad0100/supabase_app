import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:supabase_app/features/profile/presentation/cubit/profile_state.dart';

class ProfileFeatureScreen extends StatelessWidget {
  const ProfileFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final _ = context.read<ProfileCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Profile Feature Screen')),
      body: Column(
        children: [
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              switch (state) {
                case ProfileSuccessState _:
                  return Text(state.profile.fullName);
                default:
                  return Text("Sorry can't load your profile");
              }
            },
          ),
        ],
      ),
    );
  }
}
