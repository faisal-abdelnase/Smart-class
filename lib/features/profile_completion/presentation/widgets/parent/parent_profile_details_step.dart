import 'package:flutter/material.dart';
import 'package:smart_class/features/profile_completion/presentation/controllers/profile_completion_controller.dart';
import 'package:smart_class/features/profile_completion/presentation/widgets/custom_text_field.dart';
import 'package:smart_class/features/profile_completion/presentation/widgets/header_section.dart';

class ParentProfileDetailsStep extends StatelessWidget {
  const ParentProfileDetailsStep({
    super.key,
    required this.controller,
  });

  final ProfileCompletionController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: const ValueKey('parent-details'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderSection(
            title: 'Parent details',
            subtitle: 'Tell us about your children so we can personalize their learning journey.',
          ),
          const SizedBox(height: 20),
          CustomTextField(
            label: 'Number of children',
            hint: '2',
            icon: Icons.family_restroom_outlined,
            controller: controller.parentChildrenCountController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            label: 'Children grades',
            hint: 'Grade 3, Grade 7',
            icon: Icons.school_outlined,
            controller: controller.parentChildrenGradesController,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            label: 'Preferred subjects',
            hint: 'Math, Arabic, Science',
            icon: Icons.menu_book_outlined,
            controller: controller.parentPreferredSubjectsController,
          ),
        ],
      ),
    );
  }
}
