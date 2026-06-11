import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'instructor_dashboard_state.dart';

class InstructorDashboardCubit extends Cubit<InstructorDashboardState> {
  InstructorDashboardCubit() : super(InstructorDashboardInitial());
}
