import 'package:flutter/material.dart';
import 'package:smart_class/features/auth/data/models/user_model.dart';
import 'package:smart_class/features/auth/domain/entiyies/user.dart';
import 'package:smart_class/features/auth/domain/entiyies/user_role.dart';

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
        bioController = TextEditingController(text: user.instructorData?.bio ?? ''),
        studentGradeController = TextEditingController(
          text: user.studentData?.gradeLevel ?? '',
        ),
        studentSubjectsController = TextEditingController(
          text: user.studentData?.interestedSubjects.join(', ') ?? '',
        ),
        parentChildrenCountController = TextEditingController(
          text: user.parentData?.numberOfChildren == null ||
                  user.parentData!.numberOfChildren == 0
              ? ''
              : user.parentData!.numberOfChildren.toString(),
        ),
        parentChildrenGradesController = TextEditingController(
          text: user.parentData?.childrenGrades.join(', ') ?? '',
        ),
        parentPreferredSubjectsController = TextEditingController(
          text: user.parentData?.preferredSubjects.join(', ') ?? '',
        ),
        experience = (user.instructorData?.experienceYears ?? 5).toDouble(),
        learningStyle = user.studentData?.learningStyle ?? LearningStyle.online,
        selectedImage = user.image ?? '',
        certificates = List<String>.from(
          user.instructorData?.certificates ?? const [],
        ) {
    final controllers = [
      phoneController,
      instructorSubjectsController,
      priceController,
      bioController,
      studentGradeController,
      studentSubjectsController,
      parentChildrenCountController,
      parentChildrenGradesController,
      parentPreferredSubjectsController,
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
  final TextEditingController studentGradeController;
  final TextEditingController studentSubjectsController;
  final TextEditingController parentChildrenCountController;
  final TextEditingController parentChildrenGradesController;
  final TextEditingController parentPreferredSubjectsController;
  final List<String> certificates;

  int currentStep = 0;
  double experience;
  LearningStyle learningStyle;
  String selectedImage;

  int get totalSteps => 3;
  double get progress => (currentStep + 1) / totalSteps;
  UserRole get role => user.role;
  bool get isLastStep => currentStep == totalSteps - 1;
  bool get canContinue => isStepValid(currentStep);

  String get stepTitle {
    switch (currentStep) {
      case 0:
        return 'Basic Info';
      case 1:
        return '${role.label} Details';
      case 2:
        return 'Review';
      default:
        return 'Profile';
    }
  }

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

  void updateLearningStyle(LearningStyle value) {
    learningStyle = value;
    notifyListeners();
  }

  void selectImage(String value) {
    selectedImage = value;
    notifyListeners();
  }

  void addCertificate(String value) {
    final normalized = value.trim();
    if (normalized.isEmpty || certificates.contains(normalized)) return;
    certificates.add(normalized);
    notifyListeners();
  }

  void removeCertificate(String value) {
    certificates.remove(value);
    notifyListeners();
  }

  bool isStepValid(int step) {
    switch (step) {
      case 0:
        return phoneController.text.trim().isNotEmpty;
      case 1:
        switch (role) {
          case UserRole.instructor:
            return instructorSubjectsController.text.trim().isNotEmpty &&
                double.tryParse(priceController.text.trim()) != null &&
                bioController.text.trim().isNotEmpty;
          case UserRole.student:
            return studentGradeController.text.trim().isNotEmpty &&
                studentSubjectsController.text.trim().isNotEmpty;
          case UserRole.parent:
            return int.tryParse(parentChildrenCountController.text.trim()) !=
                    null &&
                parentChildrenGradesController.text.trim().isNotEmpty &&
                parentPreferredSubjectsController.text.trim().isNotEmpty;
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
              certificates: List<String>.from(certificates),
              bio: bioController.text.trim(),
            )
          : null,
      studentData: role == UserRole.student
          ? StudentData(
              gradeLevel: studentGradeController.text.trim(),
              interestedSubjects: _splitValues(studentSubjectsController.text),
              learningStyle: learningStyle,
            )
          : null,
      parentData: role == UserRole.parent
          ? ParentData(
              numberOfChildren:
                  int.tryParse(parentChildrenCountController.text.trim()) ?? 0,
              childrenGrades: _splitValues(parentChildrenGradesController.text),
              preferredSubjects:
                  _splitValues(parentPreferredSubjectsController.text),
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

  @override
  void dispose() {
    phoneController.dispose();
    instructorSubjectsController.dispose();
    priceController.dispose();
    bioController.dispose();
    studentGradeController.dispose();
    studentSubjectsController.dispose();
    parentChildrenCountController.dispose();
    parentChildrenGradesController.dispose();
    parentPreferredSubjectsController.dispose();
    super.dispose();
  }
}
