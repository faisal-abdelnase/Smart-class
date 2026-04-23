import 'package:flutter/material.dart';
import 'package:smart_class/features/auth/domain/entiyies/user_role.dart';
import 'package:smart_class/features/profile_completion/presentation/controllers/profile_completion_controller.dart';
import 'package:smart_class/features/profile_completion/presentation/widgets/custom_text_field.dart';
import 'package:smart_class/features/profile_completion/presentation/widgets/header_section.dart';

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
          const HeaderSection(
            title: 'Student details',
            subtitle:
                'Tell us where the student is studying so we can personalize the learning journey.',
          ),
          const SizedBox(height: 20),
          Text(
            'Education level',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: EducationLevel.values
                .map(
                  (level) => ChoiceChip(
                    label: Text('${level.label} (${level.arabicLabel})'),
                    selected: controller.studentEducationLevel == level,
                    onSelected: (_) =>
                        controller.updateStudentEducationLevel(level),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 20),
          CustomTextField(
            label: 'School / University Name',
            hint: 'Future Academy School',
            icon: Icons.account_balance_outlined,
            controller: controller.studentSchoolController,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            label: 'Grade / Stage Details',
            hint: 'Grade 5, Year 2, Level 1',
            icon: Icons.school_outlined,
            controller: controller.studentStageDetailsController,
          ),
        ],
      ),
    );
  }
}
