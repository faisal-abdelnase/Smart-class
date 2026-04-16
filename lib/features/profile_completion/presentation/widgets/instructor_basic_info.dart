import 'package:flutter/material.dart';
import 'package:smart_class/features/profile_completion/presentation/widgets/note_card.dart';
import 'header_section.dart';
import 'phone_field.dart';
import 'profile_image.dart';


class InstructorBasicInfo extends StatelessWidget {
  const InstructorBasicInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        key: const ValueKey("step1"),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          
          SizedBox(height: 24),
          HeaderSection(),
          SizedBox(height: 24),
          ProfileImage(),
          SizedBox(height: 24),
          PhoneField(),
          SizedBox(height: 24),
          NoteCard(),
        ],
      ),
    );
  }
}