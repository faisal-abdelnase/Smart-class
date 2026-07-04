import 'package:flutter/material.dart';
import 'package:smart_class/core/responsive/app_responsive.dart';
import 'package:smart_class/core/theme/app_theme_extensions.dart';
import 'package:smart_class/core/theme/app_text_styles.dart';
import 'package:smart_class/core/utils/extensions.dart';
import '../../domain/entities/student_entity.dart';
import '../widgets/student_table.dart';


class GroupStudentsView extends StatelessWidget {
  const GroupStudentsView({super.key, required this.compact});

  final bool compact;

  static final List<StudentInfo> studentItems = [
    StudentInfo(
      name: 'Sara Ahmed',
      id: '2025001',
      averageScore: 92,
      attendance: 98,
      status: StudentStatus.active,
      avatarColor: const Color(0xFF4F46E5),
    ),
    StudentInfo(
      name: 'Mohamed Khaled',
      id: '2025002',
      averageScore: 78,
      attendance: 91,
      status: StudentStatus.active,
      avatarColor: const Color(0xFF0EA5E9),
    ),
    StudentInfo(
      name: 'Nour Ramy',
      id: '2025003',
      averageScore: 65,
      attendance: 80,
      status: StudentStatus.atRisk,
      avatarColor: const Color(0xFFEC4899),
    ),
    StudentInfo(
      name: 'Ali Hassan',
      id: '2025004',
      averageScore: 95,
      attendance: 100,
      status: StudentStatus.active,
      avatarColor: const Color(0xFF16A34A),
    ),
    StudentInfo(
      name: 'Layla Mostafa',
      id: '2025005',
      averageScore: 49,
      attendance: 72,
      status: StudentStatus.struggling,
      avatarColor: const Color(0xFFF59E0B),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final responsive = AppResponsive.of(context);
    final tokens = Theme.of(context).extension<AppThemeColors>()!;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.hPadding,
        vertical: responsive.sp(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${context.tr('group_students_title')} (${studentItems.length})",
                style: AppTypography.h3.copyWith(color: tokens.text1),
              ),

              SizedBox(
                width: 200,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: context.tr('search_hint'),
                    prefixIcon: const Icon(Icons.search),
                    isDense: true,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: responsive.sp(12)),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(responsive.sp(8)),
              child: StudentTable(students: studentItems),
            ),
          ),
        ],
      ),
    );
  }
}
