import 'package:flutter/material.dart';
import 'package:smart_class/features/auth/domain/entiyies/user_role.dart';
import 'package:smart_class/features/profile_completion/presentation/controllers/profile_completion_controller.dart';
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
            title: "Let's set up your profile",
            subtitle: controller.role.onboardingSubtitle,
          ),
          const SizedBox(height: 24),
          ProfileImage(
            selectedImage: controller.selectedImage,
            onChanged: controller.selectImage,
          ),
          const SizedBox(height: 24),
          CustomTextField(
            label: 'Phone Number',
            hint: '(555) 000-0000',
            icon: Icons.phone,
            controller: controller.phoneController,
            keyboardType: TextInputType.phone,
          ),
        ],
      ),
    );
  }
}
