import 'package:flutter/material.dart';
import 'package:smart_class/features/groups/presentation/views/exams_view.dart';
import 'package:smart_class/features/groups/presentation/views/posts_view.dart';
import 'package:smart_class/features/groups/presentation/views/student_view.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/utils/extensions.dart';
import '../views/assignments_view.dart';
import '../views/schedule_view.dart';



class GroupDetailsPanel extends StatelessWidget {
  const GroupDetailsPanel({super.key, required this.memberCount, required this.compact});

  final int memberCount;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppThemeColors>()!;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: tokens.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: tokens.borderStrong),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          Material(
            color: tokens.surfaceRaised,
            child: TabBar(
              isScrollable: true,
              padding: EdgeInsetsDirectional.only(start: compact ? 8 : 18),
              labelPadding: EdgeInsets.symmetric(horizontal: compact ? 14 : 18),
              tabs: <Widget>[
                Tab(text: context.tr('posts')),
                Tab(text: context.tr('exams')),
                Tab(text: context.tr('assignments')),
                Tab(text: context.tr('Schedule')),
                Tab(text: context.tr('Students')),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: <Widget>[
                PostsView(compact: compact),
                GroupExamsView(compact: compact),
                AssignmentsView(compact: compact),
                ScheduleView(compact: compact),
                GroupStudentsView(compact: compact),
              ],
            ),
          ),
        ],
      ),
    );
  }
}