import 'package:flutter/material.dart';
import 'package:smart_class/features/auth/domain/entiyies/user_role.dart';
import 'package:smart_class/features/profile_completion/presentation/controllers/profile_completion_controller.dart';
import 'package:smart_class/features/profile_completion/presentation/widgets/header_section.dart';
import 'package:smart_class/features/profile_completion/presentation/widgets/info_section.dart';
import 'package:smart_class/features/profile_completion/presentation/widgets/user_card.dart';

class ProfileCompletionReview extends StatelessWidget {
  const ProfileCompletionReview({
    super.key,
    required this.controller,
  });

  final ProfileCompletionController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: ValueKey('${controller.role.name}-review'),
      child: Center(
        child: Container(
          width:
              MediaQuery.of(context).size.width > 700 ? 700 : double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const HeaderSection(
                title: 'Review your profile',
                subtitle: 'Double-check your details before finishing setup.',
              ),
              const SizedBox(height: 20),
              UserCard(
                name: controller.user.name,
                role: controller.role.label,
                imagePath: controller.selectedImage,
              ),
              const SizedBox(height: 20),
              InfoSection(
                title: 'Personal Info',
                items: [
                  InfoItem(
                    icon: Icons.email,
                    title: 'Email',
                    value: controller.user.email,
                  ),
                  InfoItem(
                    icon: Icons.phone,
                    title: 'Phone',
                    value: controller.phoneController.text.trim(),
                  ),
                ],
                onEdit: () => controller.jumpToStep(0),
              ),
              const SizedBox(height: 20),
              InfoSection(
                title: '${controller.role.label} Details',
                items: _buildRoleItems(controller),
                onEdit: () => controller.jumpToStep(1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<InfoItem> _buildRoleItems(ProfileCompletionController controller) {
  switch (controller.role) {
    case UserRole.instructor:
      return [
        InfoItem(
          icon: Icons.book_outlined,
          title: 'Subjects',
          value: controller.instructorSubjectsController.text.trim(),
        ),
        InfoItem(
          icon: Icons.timer_outlined,
          title: 'Experience',
          value: '${controller.experience.round()} years',
        ),
        InfoItem(
          icon: Icons.attach_money,
          title: 'Price',
          value: controller.priceController.text.trim(),
        ),
        InfoItem(
          icon: Icons.badge_outlined,
          title: 'Certificates',
          value: controller.certificateFiles.isEmpty
              ? 'Not added yet'
              : controller.certificateFiles
                  .map((file) => file.path.split(r'\').last)
                  .join(', '),
        ),
      ];
    case UserRole.student:
      return [
        InfoItem(
          icon: Icons.school_outlined,
          title: 'Education Level',
          value: controller.studentEducationLevel == null
              ? 'Not selected'
              : '${controller.studentEducationLevel!.label} (${controller.studentEducationLevel!.arabicLabel})',
        ),
        InfoItem(
          icon: Icons.account_balance_outlined,
          title: 'School / University',
          value: controller.studentSchoolController.text.trim(),
        ),
        InfoItem(
          icon: Icons.layers_outlined,
          title: 'Stage Details',
          value: controller.studentStageDetailsController.text.trim(),
        ),
      ];
    case UserRole.parent:
      return [
        InfoItem(
          icon: Icons.family_restroom_outlined,
          title: 'Children',
          value: controller.children
              .map(
                (child) =>
                    '${child.name.trim().isEmpty ? 'Unnamed child' : child.name.trim()} - ${child.school.trim().isEmpty ? 'No school' : child.school.trim()} - ${child.grade.trim().isEmpty ? 'No grade' : child.grade.trim()}',
              )
              .join(' | '),
        ),
      ];
  }
}
