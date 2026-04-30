import 'package:flutter/material.dart';
import 'package:smart_class/core/utils/extensions.dart';
import 'package:smart_class/features/profile_completion/presentation/helpers/profile_completion_localization.dart';
import 'package:smart_class/features/auth/domain/entiyies/user.dart';
import 'package:smart_class/features/profile_completion/presentation/widgets/custom_text_field.dart';

class ChildDetailsCard extends StatefulWidget {
  const ChildDetailsCard({
    super.key,
    required this.index,
    required this.child,
    required this.onChanged,
    required this.onRemove,
    required this.canRemove,
  });

  final int index;
  final Child child;
  final ValueChanged<Child> onChanged;
  final VoidCallback onRemove;
  final bool canRemove;

  @override
  State<ChildDetailsCard> createState() => _ChildDetailsCardState();
}

class _ChildDetailsCardState extends State<ChildDetailsCard> {
  late final TextEditingController nameController;
  late final TextEditingController schoolController;
  late final TextEditingController gradeController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.child.name);
    schoolController = TextEditingController(text: widget.child.school);
    gradeController = TextEditingController(text: widget.child.grade);

    nameController.addListener(_notifyChange);
    schoolController.addListener(_notifyChange);
    gradeController.addListener(_notifyChange);
  }

  @override
  void didUpdateWidget(covariant ChildDetailsCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    _syncController(nameController, widget.child.name);
    _syncController(schoolController, widget.child.school);
    _syncController(gradeController, widget.child.grade);
  }

  @override
  void dispose() {
    nameController.dispose();
    schoolController.dispose();
    gradeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedSize(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOutCubic,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color:
              theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.35),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: theme.colorScheme.outlineVariant.withValues(alpha: 0.55),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    getLocalizedChildTitle(context, widget.index),
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                if (widget.canRemove)
                  IconButton(
                    onPressed: widget.onRemove,
                    icon: const Icon(Icons.delete_outline),
                    tooltip: context.tr('remove_child'),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            CustomTextField(
              label: context.tr('child_name'),
              hint: context.tr('child_name_hint'),
              errorText: context.trOrNull(
                widget.child.name.trim().isEmpty ? 'child_name_required' : null,
              ),
              icon: Icons.person_outline,
              controller: nameController,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: context.tr('school_name'),
              hint: context.tr('school_name_hint'),
              errorText: context.trOrNull(
                widget.child.school.trim().isEmpty
                    ? 'child_school_required'
                    : null,
              ),
              icon: Icons.account_balance_outlined,
              controller: schoolController,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: context.tr('stage_grade'),
              hint: context.tr('stage_grade_hint'),
              errorText: context.trOrNull(
                widget.child.grade.trim().isEmpty
                    ? 'child_grade_required'
                    : null,
              ),
              icon: Icons.school_outlined,
              controller: gradeController,
            ),
          ],
        ),
      ),
    );
  }

  void _notifyChange() {
    widget.onChanged(
      Child(
        name: nameController.text,
        school: schoolController.text,
        grade: gradeController.text,
      ),
    );
  }

  void _syncController(TextEditingController controller, String value) {
    if (controller.text == value) return;
    controller.value = controller.value.copyWith(
      text: value,
      selection: TextSelection.collapsed(offset: value.length),
      composing: TextRange.empty,
    );
  }
}
