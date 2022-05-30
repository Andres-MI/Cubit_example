import 'package:cubit/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void selectUser(User user) {
    emit(UserActive(user));
  }

  void changeAge(int age) {
    final currentState = state;
    if (currentState is UserActive) {
      final newUser = currentState.user.copyWith(age: age);
      emit(UserActive(newUser));
    }
  }

  void addJob(String job) {
    final currentState = state;
    if (currentState is UserActive) {
      ///Operator spread:
      //final newJobs =[...?currentState.user.jobs];
      final List<String> jobs = currentState.user.jobs ?? [];
      jobs.add(job);
      final newUser = currentState.user.copyWith(jobs: jobs);
      emit(UserActive(newUser));
    }
  }

  void deleteUser() {
    emit(UserInitial());
  }
}
