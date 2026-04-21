import 'package:flutter/material.dart';
import 'package:smart_class/features/profile_completion/presentation/controllers/profile_completion_controller.dart';
import 'package:smart_class/features/profile_completion/presentation/widgets/custom_text_field.dart';
import 'package:smart_class/features/profile_completion/presentation/widgets/experience_slider.dart';
import 'package:smart_class/features/profile_completion/presentation/widgets/header_section.dart';

class InstructorProfileDetailsStep extends StatefulWidget {
  const InstructorProfileDetailsStep({
    super.key,
    required this.controller,
  });

  final ProfileCompletionController controller;

  @override
  State<InstructorProfileDetailsStep> createState() =>
      _InstructorProfileDetailsStepState();
}

class _InstructorProfileDetailsStepState
    extends State<InstructorProfileDetailsStep> {
  late final TextEditingController certificateController;

  @override
  void initState() {
    super.initState();
    certificateController = TextEditingController();
  }

  @override
  void dispose() {
    certificateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: const ValueKey('instructor-details'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderSection(
            title: 'Instructor details',
            subtitle: 'Add your subjects, experience, pricing, and teaching highlights.',
          ),
          const SizedBox(height: 20),
          CustomTextField(
            label: 'Subjects',
            hint: 'Math, Science, Physics',
            icon: Icons.menu_book_outlined,
            controller: widget.controller.instructorSubjectsController,
          ),
          const SizedBox(height: 20),
          ExperienceSlider(
            value: widget.controller.experience,
            onChanged: widget.controller.updateExperience,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            label: 'Price per hour',
            hint: '20',
            icon: Icons.attach_money,
            controller: widget.controller.priceController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ),
          const SizedBox(height: 20),
          CustomTextField(
            label: 'Bio',
            hint: 'Tell learners about your teaching style',
            icon: Icons.person_outline,
            controller: widget.controller.bioController,
            maxLines: 4,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  label: 'Certificates',
                  hint: 'Add one certificate and tap +',
                  icon: Icons.workspace_premium_outlined,
                  controller: certificateController,
                ),
              ),
              const SizedBox(width: 12),
              IconButton.filled(
                onPressed: () {
                  widget.controller.addCertificate(certificateController.text);
                  certificateController.clear();
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: widget.controller.certificates
                .map(
                  (certificate) => InputChip(
                    label: Text(certificate),
                    onDeleted: () => widget.controller.removeCertificate(certificate),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
