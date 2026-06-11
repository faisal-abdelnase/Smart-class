class DashboardRemoteDataSource {
  Future<Map<String, dynamic>> getData() async {
    // هنا Firebase أو API
    return {
      "totalStudents": 100,
      "activeGroups": 5,
      "examsPending": 2,
      "avgScore": 80
    };
  }
}