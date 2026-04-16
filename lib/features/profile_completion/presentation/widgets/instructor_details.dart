import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smart_class/features/profile_completion/presentation/widgets/custom_text_field.dart';
import 'package:smart_class/features/profile_completion/presentation/widgets/header_section.dart';
import 'certificate_upload_section.dart';
import 'experience_slider.dart';


class InstructorDetails extends StatefulWidget {
  const InstructorDetails({super.key});

  @override
  State<InstructorDetails> createState() => _InstructorDetailsState();
}

class _InstructorDetailsState extends State<InstructorDetails> {
  double experience = 5;
  int selectedTime = 0;

  List<File> certificates = [];
  final times = ["09:00 AM", "10:00 AM", "11:30 AM", "01:00 PM"];


  late TextEditingController priceController;
  late TextEditingController bioController;

  @override
  void initState() {
    priceController = TextEditingController();
    bioController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    priceController.dispose();
    bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        key: const ValueKey("step2"),
        
        children: [
          HeaderSection(),
      
          const SizedBox(height: 20),
      
          /// Specialization
          CustomTextField(label: "Specialization", hint: "e.g. Math, Science, etc.", icon: Icons.school),
      
          const SizedBox(height: 20),
      
          /// Experience
          ExperienceSlider(
            value: experience,
            onChanged: (v) => setState(() => experience = v),
          ),
      
          const SizedBox(height: 20),
      
      
          /// Price
          CustomTextField(label:  "Price per hour", hint: "e.g. 20 USD", icon: Icons.attach_money),
      
          const SizedBox(height: 20),
      
          /// Bio
          CustomTextField(label:  "Bio", hint: "Tell us about yourself", icon: Icons.person, maxLines: 4),
      
          const SizedBox(height: 20),


          CertificateUploadSection(
            files: certificates,
            onAdd: (file) {
              setState(() => certificates.add(file));
            },
            onRemove: (file) {
              setState(() => certificates.remove(file));
            },
          ),
      

          
        ],
      ),
    );
  }
}