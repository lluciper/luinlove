import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void saveDate() {
    emit(state.copyWith(saveDate: state.changeDate));
  }

  void changeDate(DateTime? date) {
    emit(state.copyWith(changeDate: date));
  }
}
