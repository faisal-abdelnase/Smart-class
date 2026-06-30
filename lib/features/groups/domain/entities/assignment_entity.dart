class AssignmentInfo {
  const AssignmentInfo({
    required this.id,
    required this.titleKey,
    this.subtitleKey,
    this.dueDate,
    this.description,
    this.completed = false,
  });

  final String id;
  final String titleKey;
  final String? subtitleKey;
  final String? description;
  final DateTime? dueDate;
  final bool completed;
}
