import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class PhoneField extends StatefulWidget {
  const PhoneField({super.key});

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {


  late TextEditingController phoneController;

  @override
  void initState() {
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: "Phone Number",
      hint: "(555) 000-0000",
      icon: Icons.phone,
      controller: phoneController,
    );
  }
}