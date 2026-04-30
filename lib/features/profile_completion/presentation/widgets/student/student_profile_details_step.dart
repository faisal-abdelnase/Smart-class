import 'package:flutter/material.dart';
import 'package:smart_class/core/utils/extensions.dart';
import 'package:smart_class/features/profile_completion/presentation/controllers/profile_completion_controller.dart';
import 'package:smart_class/features/profile_completion/presentation/helpers/profile_completion_localization.dart';
import 'package:smart_class/features/profile_completion/presentation/widgets/custom_text_field.dart';
import 'package:smart_class/features/profile_completion/presentation/widgets/header_section.dart';

import '../../../../auth/domain/entiyies/user_role.dart';

class StudentProfileDetailsStep extends StatelessWidget {
  const StudentProfileDetailsStep({
    super.key,
    required this.controller,
  });

  final ProfileCompletionController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: const ValueKey('student-details'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderSection(
            title: context.tr('student_details'),
            subtitle: context.tr('student_details_subtitle'),
          ),
          const SizedBox(height: 20),
          Text(
            context.tr('education_level'),
            style: Theme.of(context).textTheme.titleSmall,
          ),
          if (controller.studentEducationLevelErrorKey != null) ...[
            const SizedBox(height: 8),
            Text(
              context.tr(controller.studentEducationLevelErrorKey!),
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ],
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: EducationLevel.values
                .map(
                  (level) => ChoiceChip(
                    label: Text(getLocalizedEducationLevel(context, level)),
                    selected: controller.studentEducationLevel == level,
                    onSelected: (_) =>
                        controller.updateStudentEducationLevel(level),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 20),
          CustomTextField(
            label: context.tr('school_university_name'),
            hint: context.tr('school_university_hint'),
            errorText: context.trOrNull(controller.studentSchoolErrorKey),
            icon: Icons.account_balance_outlined,
            controller: controller.studentSchoolController,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            label: context.tr('grade_stage_details'),
            hint: context.tr('grade_stage_details_hint'),
            errorText: context.trOrNull(controller.studentStageDetailsErrorKey),
            icon: Icons.school_outlined,
            controller: controller.studentStageDetailsController,
          ),
        ],
      ),
    );
  }
}
