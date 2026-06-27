import 'package:flutter/material.dart';
import 'package:smart_class/features/groups/presentation/views/exams_view.dart';
import 'package:smart_class/features/groups/presentation/views/posts_view.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/utils/extensions.dart';
import 'empty_group_tab.dart';


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
                Tab(text: context.tr('ranking')),
                Tab(text: context.tr('members')),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: <Widget>[
                PostsView(compact: compact),
                GroupExamsView(compact: compact),
                EmptyGroupTab(
                  icon: Icons.assignment_outlined,
                  title: context.tr('assignments'),
                  message: context.tr('group_assignments_empty'),
                ),
                EmptyGroupTab(
                  icon: Icons.leaderboard_outlined,
                  title: context.tr('ranking'),
                  message: context.tr('group_ranking_empty'),
                ),
                EmptyGroupTab(
                  icon: Icons.groups_2_outlined,
                  title: context.tr('members_count_badge', <String, String>{
                    'count': memberCount.toString(),
                  }),
                  message: context.tr('group_members_empty'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}