import 'package:flutter/material.dart';
import 'package:smart_class/core/utils/extensions.dart';
import 'package:smart_class/features/auth/domain/entiyies/user_role.dart';
import 'package:smart_class/features/profile_completion/presentation/controllers/profile_completion_controller.dart';
import 'package:smart_class/features/profile_completion/presentation/helpers/profile_completion_localization.dart';
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
              HeaderSection(
                title: context.tr('review_your_profile'),
                subtitle: context.tr('review_your_profile_subtitle'),
              ),
              const SizedBox(height: 20),
              UserCard(
                name:
                    controller.user.name.trim().isEmpty ||
                        controller.user.name == controller.role.label
                    ? getLocalizedUserRole(context, controller.role)
                    : controller.user.name,
                role: getLocalizedUserRole(context, controller.role),
                imagePath: controller.selectedImage,
              ),
              const SizedBox(height: 20),
              InfoSection(
                title: context.tr('personal_info'),
                items: [
                  InfoItem(
                    icon: Icons.email,
                    title: context.tr('email_address'),
                    value: controller.user.email,
                  ),
                  InfoItem(
                    icon: Icons.phone,
                    title: context.tr('phone'),
                    value: controller.phoneController.text.trim(),
                  ),
                ],
                onEdit: () => controller.jumpToStep(0),
              ),
              const SizedBox(height: 20),
              InfoSection(
                title: getLocalizedRoleDetailsTitle(context, controller.role),
                items: _buildRoleItems(context, controller),
                onEdit: () => controller.jumpToStep(1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<InfoItem> _buildRoleItems(
  BuildContext context,
  ProfileCompletionController controller,
) {
  switch (controller.role) {
    case UserRole.instructor:
      return [
        InfoItem(
          icon: Icons.book_outlined,
          title: context.tr('subjects'),
          value: controller.instructorSubjectsController.text.trim(),
        ),
        InfoItem(
          icon: Icons.timer_outlined,
          title: context.tr('experience'),
          value: getLocalizedExperienceValue(context, controller.experience),
        ),
        InfoItem(
          icon: Icons.attach_money,
          title: context.tr('price'),
          value: controller.priceController.text.trim(),
        ),
        InfoItem(
          icon: Icons.badge_outlined,
          title: context.tr('certificates'),
          value: controller.certificateFiles.isEmpty
              ? context.tr('not_added_yet')
              : controller.certificateFiles
                  .map((file) => file.path.split(r'\').last)
                  .join(', '),
        ),
      ];
    case UserRole.student:
      return [
        InfoItem(
          icon: Icons.school_outlined,
          title: context.tr('education_level'),
          value: controller.studentEducationLevel == null
              ? context.tr('not_selected')
              : getLocalizedEducationLevel(
                  context,
                  controller.studentEducationLevel!,
                ),
        ),
        InfoItem(
          icon: Icons.account_balance_outlined,
          title: context.tr('school_university'),
          value: controller.studentSchoolController.text.trim(),
        ),
        InfoItem(
          icon: Icons.layers_outlined,
          title: context.tr('stage_details'),
          value: controller.studentStageDetailsController.text.trim(),
        ),
      ];
    case UserRole.parent:
      return [
        InfoItem(
          icon: Icons.family_restroom_outlined,
          title: context.tr('children'),
          value: getLocalizedChildrenSummary(context, controller.children),
        ),
      ];
  }
}
