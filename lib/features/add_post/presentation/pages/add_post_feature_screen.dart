import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:supabase_app/core/extensions/font_extensions.dart';
import 'package:supabase_app/core/widgets/buttons/custom_button.dart';
import 'package:supabase_app/core/widgets/field/custom_field.dart';
import 'package:supabase_app/features/add_post/presentation/cubit/add_post_cubit.dart';

class AddPostFeatureScreen extends StatelessWidget {
  const AddPostFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final _ = context.read<AddPostCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('AddPost Feature Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomField(title: "title"),
            Gap(10.sizeSH(min: 16, max: 32)),
            CustomButtons(
              title: "Post",
              onPressed: () {
                context.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
