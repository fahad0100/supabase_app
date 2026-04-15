import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:supabase_app/core/extensions/context_extensions.dart';
import 'package:supabase_app/core/extensions/font_extensions.dart';
import 'package:supabase_app/core/widgets/buttons/custom_button.dart';
import 'package:supabase_app/core/widgets/field/custom_field.dart';
import 'package:supabase_app/features/add_post/presentation/cubit/add_post_cubit.dart';
import 'package:supabase_app/features/add_post/presentation/cubit/add_post_state.dart';

class AddPostFeatureScreen extends HookWidget {
  const AddPostFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddPostCubit>();
    final postController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('AddPost Feature Screen')),
      body: BlocListener<AddPostCubit, AddPostState>(
        listener: (context, state) {
          context.hideLoading();
          switch (state) {
            case AddPostLoadingState _:
              context.showLoading();
              break;
            case AddPostSuccessState _:
              context.pop(true);
              break;
            case AddPostErrorState _:
              context.showSnackBar(state.message, isError: true);
              break;
            default:
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CustomField(title: "title", controller: postController),
              Gap(10.sizeSH(min: 16, max: 32)),
              CustomButtons(
                title: "Post",
                onPressed: () {
                  cubit.getAddPostMethod(content: postController.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
