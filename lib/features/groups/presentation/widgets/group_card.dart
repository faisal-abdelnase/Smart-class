import 'package:flutter/material.dart';
import 'package:smart_class/core/utils/extensions.dart';
import '../../data/models/group_model.dart';
import '../pages/group_details_page.dart';
import 'group_color_badge.dart';
import 'student_count.dart';

class GroupCard extends StatelessWidget {
  const GroupCard({required this.group, super.key});

  final GroupModel group;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    void openGroupDetails() {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (_) => GroupDetailsPage(group: group)));
    }

    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      color: colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: colorScheme.outlineVariant),
      ),
      child: InkWell(
        onTap: openGroupDetails,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  GroupColorBadge(group: group),
                  const Spacer(),
                  Icon(
                    Icons.arrow_outward_rounded,
                    color: colorScheme.onSurfaceVariant,
                    size: 22,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                group.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                group.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  height: 1.4,
                ),
              ),
              const Spacer(),
              StudentCount(count: group.studentCount),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: openGroupDetails,
                  child: Text(context.tr('view_group')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
