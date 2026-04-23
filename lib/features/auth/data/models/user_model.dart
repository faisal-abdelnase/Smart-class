import '../../domain/entiyies/user.dart';
import '../../domain/entiyies/user_role.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.role,
    super.phone,
    super.image,
    super.isProfileComplete,
    super.instructorData,
    super.studentData,
    super.parentData,
  });

  factory UserModel.fromJson(Map<String, dynamic> json, String id) {
    return UserModel(
      id: id,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      role: UserRoleX.fromName(json['role'] ?? UserRole.instructor.name),
      phone: json['phone'] as String?,
      image: json['image'] as String?,
      isProfileComplete: json['isProfileComplete'] as bool? ?? false,
      instructorData: _instructorFromJson(json['instructorData']),
      studentData: _studentFromJson(json['studentData']),
      parentData: _parentFromJson(json['parentData']),
    );
  }

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    UserRole? role,
    String? phone,
    String? image,
    bool? isProfileComplete,
    InstructorData? instructorData,
    StudentData? studentData,
    ParentData? parentData,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      phone: phone ?? this.phone,
      image: image ?? this.image,
      isProfileComplete: isProfileComplete ?? this.isProfileComplete,
      instructorData: instructorData ?? this.instructorData,
      studentData: studentData ?? this.studentData,
      parentData: parentData ?? this.parentData,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'role': role.name,
      'phone': phone,
      'image': image,
      'isProfileComplete': isProfileComplete,
      'instructorData': _instructorToJson(instructorData),
      'studentData': _studentToJson(studentData),
      'parentData': _parentToJson(parentData),
    };
  }
}

InstructorData? _instructorFromJson(dynamic value) {
  if (value is! Map<String, dynamic>) return null;
  return InstructorData(
    subjects: List<String>.from(value['subjects'] as List? ?? const []),
    experienceYears: value['experienceYears'] as int? ?? 0,
    pricePerHour: (value['pricePerHour'] as num?)?.toDouble() ?? 0,
    certificates: List<String>.from(value['certificates'] as List? ?? const []),
    bio: value['bio'] as String? ?? '',
  );
}

StudentData? _studentFromJson(dynamic value) {
  if (value is! Map<String, dynamic>) return null;
  return StudentData(
    educationLevel: EducationLevelX.fromValue(
      value['educationLevel'] as String?,
    ),
    schoolName: value['schoolName'] as String? ?? '',
    stageDetails: value['stageDetails'] as String? ??
        value['gradeLevel'] as String? ??
        '',
  );
}

ParentData? _parentFromJson(dynamic value) {
  if (value is! Map<String, dynamic>) return null;
  final rawChildren = value['children'];

  if (rawChildren is List) {
    return ParentData(
      children: rawChildren
          .whereType<Map>()
          .map(
            (child) => Child(
              name: child['name'] as String? ?? '',
              school: child['school'] as String? ?? '',
              grade: child['grade'] as String? ?? '',
            ),
          )
          .toList(),
    );
  }

  final legacyGrades = List<String>.from(
    value['childrenGrades'] as List? ?? const [],
  );
  return ParentData(
    children: legacyGrades
        .map(
          (grade) => Child(
            name: '',
            school: '',
            grade: grade,
          ),
        )
        .toList(),
  );
}

Map<String, dynamic>? _instructorToJson(InstructorData? value) {
  if (value == null) return null;
  return {
    'subjects': value.subjects,
    'experienceYears': value.experienceYears,
    'pricePerHour': value.pricePerHour,
    'certificates': value.certificates,
    'bio': value.bio,
  };
}

Map<String, dynamic>? _studentToJson(StudentData? value) {
  if (value == null) return null;
  return {
    'educationLevel': value.educationLevel?.storageValue,
    'schoolName': value.schoolName,
    'stageDetails': value.stageDetails,
  };
}

Map<String, dynamic>? _parentToJson(ParentData? value) {
  if (value == null) return null;
  return {
    'children': value.children
        .map(
          (child) => {
            'name': child.name,
            'school': child.school,
            'grade': child.grade,
          },
        )
        .toList(),
  };
}
