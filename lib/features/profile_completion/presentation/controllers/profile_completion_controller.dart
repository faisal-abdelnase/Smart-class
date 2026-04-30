import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smart_class/features/auth/data/models/user_model.dart';
import 'package:smart_class/features/auth/domain/entiyies/user.dart';
import 'package:smart_class/features/auth/domain/entiyies/user_role.dart';
import 'package:smart_class/features/profile_completion/presentation/helpers/profile_completion_localization.dart';

class ProfileCompletionController extends ChangeNotifier {
  ProfileCompletionController(this.user)
      : phoneController = TextEditingController(text: user.phone ?? ''),
        instructorSubjectsController = TextEditingController(
          text: user.instructorData?.subjects.join(', ') ?? '',
        ),
        priceController = TextEditingController(
          text: user.instructorData?.pricePerHour == null ||
                  user.instructorData!.pricePerHour == 0
              ? ''
              : user.instructorData!.pricePerHour.toString(),
        ),
        bioController =
            TextEditingController(text: user.instructorData?.bio ?? ''),
        studentSchoolController = TextEditingController(
          text: user.studentData?.schoolName ?? '',
        ),
        studentStageDetailsController = TextEditingController(
          text: user.studentData?.stageDetails ?? '',
        ),
        experience = (user.instructorData?.experienceYears ?? 5).toDouble(),
        studentEducationLevel = user.studentData?.educationLevel,
        selectedImage = user.image ?? '',
        certificateFiles = (user.instructorData?.certificates ?? const [])
            .where((path) => path.trim().isNotEmpty)
            .map((path) => File(path))
            .toList(),
        children = List<Child>.from(user.parentData?.children ?? const []) {
    if (role == UserRole.parent && children.isEmpty) {
      children.add(const Child(name: '', school: '', grade: ''));
    }

    final controllers = [
      phoneController,
      instructorSubjectsController,
      priceController,
      bioController,
      studentSchoolController,
      studentStageDetailsController,
    ];

    for (final controller in controllers) {
      controller.addListener(notifyListeners);
    }
  }

  final UserModel user;
  final TextEditingController phoneController;
  final TextEditingController instructorSubjectsController;
  final TextEditingController priceController;
  final TextEditingController bioController;
  final TextEditingController studentSchoolController;
  final TextEditingController studentStageDetailsController;
  final List<File> certificateFiles;
  final List<Child> children;

  int currentStep = 0;
  double experience;
  EducationLevel? studentEducationLevel;
  String selectedImage;

  int get totalSteps => 3;
  double get progress => (currentStep + 1) / totalSteps;
  UserRole get role => user.role;
  bool get isLastStep => currentStep == totalSteps - 1;
  bool get canContinue => isStepValid(currentStep);

  String stepTitle(BuildContext context) {
    return getProfileCompletionStepTitle(context, currentStep, role);
  }

  String? get phoneErrorKey =>
      phoneController.text.trim().isEmpty ? 'phone_required' : null;

  String? get instructorSubjectsErrorKey =>
      instructorSubjectsController.text.trim().isEmpty
      ? 'subjects_required'
      : null;

  String? get priceErrorKey {
    final price = priceController.text.trim();
    if (price.isEmpty) return 'price_required';
    if (double.tryParse(price) == null) return 'price_invalid';
    return null;
  }

  String? get bioErrorKey =>
      bioController.text.trim().isEmpty ? 'bio_required' : null;

  String? get studentEducationLevelErrorKey =>
      studentEducationLevel == null ? 'education_level_required' : null;

  String? get studentSchoolErrorKey =>
      studentSchoolController.text.trim().isEmpty ? 'school_name_required' : null;

  String? get studentStageDetailsErrorKey =>
      studentStageDetailsController.text.trim().isEmpty
      ? 'stage_details_required'
      : null;

  String? childNameErrorKey(Child child) =>
      child.name.trim().isEmpty ? 'child_name_required' : null;

  String? childSchoolErrorKey(Child child) =>
      child.school.trim().isEmpty ? 'child_school_required' : null;

  String? childGradeErrorKey(Child child) =>
      child.grade.trim().isEmpty ? 'child_grade_required' : null;

  void nextStep() {
    if (!canContinue || isLastStep) return;
    currentStep++;
    notifyListeners();
  }

  void previousStep() {
    if (currentStep == 0) return;
    currentStep--;
    notifyListeners();
  }

  void jumpToStep(int step) {
    if (step < 0 || step >= totalSteps) return;
    currentStep = step;
    notifyListeners();
  }

  void updateExperience(double value) {
    experience = value;
    notifyListeners();
  }

  void updateStudentEducationLevel(EducationLevel? value) {
    if (studentEducationLevel == value) return;
    studentEducationLevel = value;
    notifyListeners();
  }

  void selectImage(String value) {
    selectedImage = value;
    notifyListeners();
  }

  void addCertificate(File file) {
    final normalizedPath = file.path.trim();
    if (normalizedPath.isEmpty ||
        certificateFiles.any((item) => item.path == normalizedPath)) {
      return;
    }
    certificateFiles.add(file);
    notifyListeners();
  }

  void removeCertificate(File file) {
    certificateFiles.removeWhere((item) => item.path == file.path);
    notifyListeners();
  }

  void addChild(Child child) {
    children.add(child);
    notifyListeners();
  }

  void removeChild(int index) {
    if (index < 0 || index >= children.length) return;
    children.removeAt(index);
    notifyListeners();
  }

  void updateChild(int index, Child child) {
    if (index < 0 || index >= children.length) return;
    children[index] = child;
    notifyListeners();
  }

  bool isStepValid(int step) {
    switch (step) {
      case 0:
        return phoneErrorKey == null;
      case 1:
        switch (role) {
          case UserRole.instructor:
            return instructorSubjectsErrorKey == null &&
                priceErrorKey == null &&
                bioErrorKey == null;
          case UserRole.student:
            return studentEducationLevelErrorKey == null &&
                studentSchoolErrorKey == null &&
                studentStageDetailsErrorKey == null;
          case UserRole.parent:
            return children.isNotEmpty && children.every(_isChildValid);
        }
      case 2:
        return true;
      default:
        return false;
    }
  }

  UserModel buildCompletedUser() {
    return UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      role: role,
      phone: phoneController.text.trim(),
      image: selectedImage.isEmpty ? null : selectedImage,
      isProfileComplete: true,
      instructorData: role == UserRole.instructor
          ? InstructorData(
              subjects: _splitValues(instructorSubjectsController.text),
              experienceYears: experience.round(),
              pricePerHour: double.tryParse(priceController.text.trim()) ?? 0,
              certificates: certificateFiles.map((file) => file.path).toList(),
              bio: bioController.text.trim(),
            )
          : null,
      studentData: role == UserRole.student
          ? StudentData(
              educationLevel: studentEducationLevel,
              schoolName: studentSchoolController.text.trim(),
              stageDetails: studentStageDetailsController.text.trim(),
            )
          : null,
      parentData: role == UserRole.parent
          ? ParentData(
              children: children
                  .map(
                    (child) => Child(
                      name: child.name.trim(),
                      school: child.school.trim(),
                      grade: child.grade.trim(),
                    ),
                  )
                  .toList(),
            )
          : null,
    );
  }

  List<String> _splitValues(String rawValue) {
    return rawValue
        .split(',')
        .map((value) => value.trim())
        .where((value) => value.isNotEmpty)
        .toList();
  }

  bool _isChildValid(Child child) {
    return child.name.trim().isNotEmpty &&
        child.school.trim().isNotEmpty &&
        child.grade.trim().isNotEmpty;
  }

  @override
  void dispose() {
    phoneController.dispose();
    instructorSubjectsController.dispose();
    priceController.dispose();
    bioController.dispose();
    studentSchoolController.dispose();
    studentStageDetailsController.dispose();
    super.dispose();
  }
}
