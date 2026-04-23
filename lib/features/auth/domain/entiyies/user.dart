import 'user_role.dart';

class User {
  final String id;
  final String name;
  final String email;
  final UserRole role;
  final String? phone;
  final String? image;
  final bool isProfileComplete;
  final InstructorData? instructorData;
  final StudentData? studentData;
  final ParentData? parentData;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.phone,
    this.image,
    this.isProfileComplete = false,
    this.instructorData,
    this.studentData,
    this.parentData,
  });
}

class InstructorData {
  final List<String> subjects;
  final int experienceYears;
  final double pricePerHour;
  final List<String> certificates;
  final String bio;

  const InstructorData({
    required this.subjects,
    required this.experienceYears,
    required this.pricePerHour,
    required this.certificates,
    required this.bio,
  });
}

class StudentData {
  final EducationLevel? educationLevel;
  final String schoolName;
  final String stageDetails;

  const StudentData({
    required this.educationLevel,
    required this.schoolName,
    required this.stageDetails,
  });
}

class ParentData {
  final List<Child> children;

  const ParentData({
    required this.children,
  });
}

class Child {
  final String name;
  final String school;
  final String grade;

  const Child({
    required this.name,
    required this.school,
    required this.grade,
  });
}
