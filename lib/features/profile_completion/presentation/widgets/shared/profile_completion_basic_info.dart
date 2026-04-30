import 'package:flutter/material.dart';
import 'package:smart_class/core/utils/extensions.dart';
import 'package:smart_class/features/profile_completion/presentation/controllers/profile_completion_controller.dart';
import 'package:smart_class/features/profile_completion/presentation/helpers/profile_completion_localization.dart';
import 'package:smart_class/features/profile_completion/presentation/widgets/custom_text_field.dart';
import 'package:smart_class/features/profile_completion/presentation/widgets/header_section.dart';
import 'package:smart_class/features/profile_completion/presentation/widgets/profile_image.dart';

class ProfileCompletionBasicInfo extends StatelessWidget {
  const ProfileCompletionBasicInfo({
    super.key,
    required this.controller,
  });

  final ProfileCompletionController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: ValueKey('${controller.role.name}-basic'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderSection(
            title: context.tr('lets_set_up_your_profile'),
            subtitle: getLocalizedOnboardingSubtitle(context, controller.role),
          ),
          const SizedBox(height: 24),
          ProfileImage(
            selectedImage: controller.selectedImage,
            onChanged: controller.selectImage,
          ),
          const SizedBox(height: 24),
          CustomTextField(
            label: context.tr('phone_number'),
            hint: context.tr('phone_number_hint'),
            errorText: context.trOrNull(controller.phoneErrorKey),
            icon: Icons.phone,
            controller: controller.phoneController,
            keyboardType: TextInputType.phone,
          ),
        ],
      ),
    );
  }
}
