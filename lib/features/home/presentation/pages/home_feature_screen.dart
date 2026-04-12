import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeFeatureScreen extends StatelessWidget {
  const HomeFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Home Feature Screen')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              cubit.getHomeMethod();
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }
}
