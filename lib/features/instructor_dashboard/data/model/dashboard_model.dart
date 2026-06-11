import '../../domain/entities/dashboard.dart';

class DashboardModel extends Dashboard {
  DashboardModel({
    required super.totalStudents,
    required super.activeGroups,
    required super.examsPending,
    required super.avgScore,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      totalStudents: json['totalStudents'],
      activeGroups: json['activeGroups'],
      examsPending: json['examsPending'],
      avgScore: json['avgScore'],
    );
  }
}