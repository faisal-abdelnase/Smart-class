import 'package:flutter/material.dart';
import 'header_section.dart';
import 'info_section.dart';
import 'user_card.dart';


class InstructorReview extends StatelessWidget {
  const InstructorReview({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isTablet = width > 600;

    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: isTablet ? 700 : double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            key: const ValueKey("step3"),
            children: [
              HeaderSection(),

              const SizedBox(height: 20),

              /// 👤 User Card
              const UserCard(),

              const SizedBox(height: 20),

              /// 📄 Personal Info
              InfoSection(
                title: "Personal Info",
                items: const [
                  InfoItem(icon: Icons.email, title: "Email", value: "sarah@example.com"),
                  InfoItem(icon: Icons.phone, title: "Phone", value: "+1 (555) 123-4567"),
                ],
              ),

              const SizedBox(height: 20),

              /// 🎓 Instructor Details
              InfoSection(
                title: "Instructor Details",
                items: const [
                  InfoItem(icon: Icons.school, title: "Specialization", value: "Advanced Mathematics"),
                  InfoItem(icon: Icons.timer, title: "Experience", value: "5 years"),
                  InfoItem(icon: Icons.book, title: "Subjects", value: "Not selected"),
                  InfoItem(icon: Icons.attach_money, title: "Price", value: "\$45/hr"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}