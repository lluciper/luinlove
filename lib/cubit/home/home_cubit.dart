import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../model/user_model/user_model.dart';
import '../../utils/utils.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void saveInformation(TypeSave typeSave) {
    switch (typeSave) {
      case TypeSave.NameMan:
        return emit(state.copyWith(saveDate: state.changeDate));
      case TypeSave.BirthDayMan:
        return emit(state.copyWith(saveDate: state.changeDate));
      case TypeSave.ImageManUrl:
        return emit(state.copyWith(saveDate: state.changeDate));
      case TypeSave.NameWomen:
        return emit(state.copyWith(saveDate: state.changeDate));
      case TypeSave.BirthDayWomen:
        return emit(state.copyWith(saveDate: state.changeDate));
      case TypeSave.ImageWomenUrl:
        return emit(state.copyWith(saveDate: state.changeDate));
      case TypeSave.Status:
        return emit(state.copyWith(saveDate: state.changeDate));
      case TypeSave.DMY:
        return emit(state.copyWith(saveDate: state.changeDate));
      case TypeSave.SaveDate:
        return emit(state.copyWith(saveDate: state.changeDate));
      default:
        return;
    }
  }

  void changeDate(DateTime? date) {
    emit(state.copyWith(changeDate: date));
  }
}
