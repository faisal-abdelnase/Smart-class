import 'package:flutter/material.dart';
import 'package:smart_class/features/auth/domain/entiyies/user.dart';
import 'package:smart_class/features/profile_completion/presentation/controllers/profile_completion_controller.dart';
import 'package:smart_class/features/profile_completion/presentation/widgets/header_section.dart';
import 'package:smart_class/features/profile_completion/presentation/widgets/parent/child_details_card.dart';

class ParentProfileDetailsStep extends StatefulWidget {
  const ParentProfileDetailsStep({
    super.key,
    required this.controller,
  });

  final ProfileCompletionController controller;

  @override
  State<ParentProfileDetailsStep> createState() =>
      _ParentProfileDetailsStepState();
}

class _ParentProfileDetailsStepState extends State<ParentProfileDetailsStep> {
  late final List<Key> _childKeys;

  @override
  void initState() {
    super.initState();
    _childKeys = List<Key>.generate(
      widget.controller.children.length,
      (_) => UniqueKey(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: const ValueKey('parent-details'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderSection(
            title: 'Parent details',
            subtitle:
                'Add each child so we can tailor recommendations with more accuracy.',
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Children details',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              FilledButton.icon(
                onPressed: _handleAddChild,
                icon: const Icon(Icons.add),
                label: const Text('Add Child'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 220),
            child: widget.controller.children.isEmpty
                ? _EmptyChildrenState(onAddChild: _handleAddChild)
                : Column(
                    key: ValueKey(widget.controller.children.length),
                    children: List.generate(
                      widget.controller.children.length,
                      (index) => Padding(
                        key: _childKeys[index],
                        padding: EdgeInsets.only(
                          bottom: index == widget.controller.children.length - 1
                              ? 0
                              : 16,
                        ),
                        child: ChildDetailsCard(
                          index: index,
                          child: widget.controller.children[index],
                          canRemove: widget.controller.children.length > 1,
                          onChanged: (child) =>
                              widget.controller.updateChild(index, child),
                          onRemove: () => _handleRemoveChild(index),
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  void _handleAddChild() {
    setState(() {
      _childKeys.add(UniqueKey());
      widget.controller.addChild(const Child(name: '', school: '', grade: ''));
    });
  }

  void _handleRemoveChild(int index) {
    if (widget.controller.children.length <= 1) return;
    setState(() {
      _childKeys.removeAt(index);
      widget.controller.removeChild(index);
    });
  }
}

class _EmptyChildrenState extends StatelessWidget {
  const _EmptyChildrenState({
    required this.onAddChild,
  });

  final VoidCallback onAddChild;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color:
            theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.55),
        ),
      ),
      child: Column(
        children: [
          Icon(
            Icons.family_restroom_outlined,
            size: 34,
            color: theme.colorScheme.primary,
          ),
          const SizedBox(height: 12),
          Text(
            'No children added yet',
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Start by adding the first child profile.',
            style: theme.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: onAddChild,
            icon: const Icon(Icons.add),
            label: const Text('Add Child'),
          ),
        ],
      ),
    );
  }
}
