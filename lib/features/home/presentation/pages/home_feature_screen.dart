import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconoir_flutter/regular/iconoir.dart';
import 'package:iconoir_flutter/regular/user_circle.dart';
import 'package:not_static_icons/not_static_icons.dart';
import 'package:supabase_app/core/extensions/font_extensions.dart';
import 'package:supabase_app/core/navigation/routers.dart';
import 'package:supabase_app/core/widgets/buttons/menu_buttons.dart';
import 'package:supabase_app/core/widgets/card/card_me.dart';
import 'package:supabase_app/features/home/presentation/cubit/home_cubit.dart';

class HomeFeatureScreen extends StatelessWidget {
  const HomeFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Feature Screen'),
        leading: IconButton(
          onPressed: () {
            context.push(Routes.profile);
          },
          icon: UserCircle(color: Colors.red),
        ),
      ),
      floatingActionButton: FanFloatingMenuWidget(
        menu: [
          InoutFanFloatingMenuWidget(
            title: "new post",
            onTap: () {
              context.push(Routes.addPost);
            },
          ),
        ],
      ),
      floatingActionButtonLocation: .centerFloat,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(spacing: 16, children: [CardMe()]),
        ),
      ),
    );
  }
}
