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
            subtitle: 'Help us recommend the right classes and study experience.',
          ),
          const SizedBox(height: 20),
          CustomTextField(
            label: 'Grade / Level',
            hint: 'Grade 10 or Beginner',
            icon: Icons.school_outlined,
            controller: controller.studentGradeController,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            label: 'Subjects interested in',
            hint: 'Math, English, Biology',
            icon: Icons.menu_book_outlined,
            controller: controller.studentSubjectsController,
          ),
          const SizedBox(height: 20),
          Text(
            'Preferred learning style',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: LearningStyle.values
                .map(
                  (style) => ChoiceChip(
                    label: Text(style.label),
                    selected: controller.learningStyle == style,
                    onSelected: (_) => controller.updateLearningStyle(style),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
