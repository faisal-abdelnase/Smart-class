import 'package:flutter/material.dart';
import 'package:smart_class/core/utils/extensions.dart';
import 'package:smart_class/features/profile_completion/presentation/controllers/profile_completion_controller.dart';
import 'package:smart_class/features/profile_completion/presentation/widgets/certificate_upload_section.dart';
import 'package:smart_class/features/profile_completion/presentation/widgets/custom_text_field.dart';
import 'package:smart_class/features/profile_completion/presentation/widgets/experience_slider.dart';
import 'package:smart_class/features/profile_completion/presentation/widgets/header_section.dart';

class InstructorProfileDetailsStep extends StatelessWidget {
  const InstructorProfileDetailsStep({
    super.key,
    required this.controller,
  });

  final ProfileCompletionController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: const ValueKey('instructor-details'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderSection(
            title: context.tr('instructor_details'),
            subtitle: context.tr('instructor_details_subtitle'),
          ),
          const SizedBox(height: 20),
          CustomTextField(
            label: context.tr('subjects'),
            hint: context.tr('subjects_hint'),
            errorText: context.trOrNull(controller.instructorSubjectsErrorKey),
            icon: Icons.menu_book_outlined,
            controller: controller.instructorSubjectsController,
          ),
          const SizedBox(height: 20),
          ExperienceSlider(
            value: controller.experience,
            onChanged: controller.updateExperience,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            label: context.tr('price_per_hour'),
            hint: context.tr('price_per_hour_hint'),
            errorText: context.trOrNull(controller.priceErrorKey),
            icon: Icons.attach_money,
            controller: controller.priceController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ),
          const SizedBox(height: 20),
          CustomTextField(
            label: context.tr('bio'),
            hint: context.tr('bio_hint'),
            errorText: context.trOrNull(controller.bioErrorKey),
            icon: Icons.person_outline,
            controller: controller.bioController,
            maxLines: 4,
          ),
          const SizedBox(height: 20),
          CertificateUploadSection(
            files: controller.certificateFiles,
            onAdd: controller.addCertificate,
            onRemove: controller.removeCertificate,
          ),
        ],
      ),
    );
  }
}
