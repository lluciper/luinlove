import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../model/user_model/user_model.dart';
import '../../utils/format_date_time.dart';
import '../../utils/utils.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void init() {
    emit(state.copyWith(information: const UserModel()));
  }

  void saveInformation({
    required TypeSave typeSave,
    String data = '',
  }) {
    switch (typeSave) {
      case TypeSave.NameMan:
        return emit(state.copyWith(
            information: state.information?.copyWith(
          nameMan: data,
        )));
      case TypeSave.BirthDayMan:
        return emit(state.copyWith(
            information: state.information?.copyWith(
          birthDayMan: data,
        )));
      case TypeSave.ImageManUrl:
        return emit(state.copyWith(
            information: state.information?.copyWith(
          imageManUrl: data,
        )));
      case TypeSave.NameWomen:
        return emit(state.copyWith(
            information: state.information?.copyWith(
          nameWomen: data,
        )));
      case TypeSave.BirthDayWomen:
        return emit(state.copyWith(
            information: state.information?.copyWith(
          birthDayWomen: data,
        )));
      case TypeSave.ImageWomenUrl:
        return emit(state.copyWith(
            information: state.information?.copyWith(
          imageWomenUrl: data,
        )));
      case TypeSave.Status:
        return emit(state.copyWith(
            information: state.information?.copyWith(
          status: data,
        )));
      case TypeSave.DMY:
        return emit(state.copyWith(
            information: state.information?.copyWith(
          dmy: data,
        )));
      case TypeSave.SaveDate:
        return emit(state.copyWith(
            saveDate: state.changeDate,
            information: state.information?.copyWith(
              saveDate: state.changeDate?.formatStringToDate,
            )));

      default:
        return;
    }
  }

  void changeDate(DateTime? date) {
    emit(state.copyWith(changeDate: date ?? DateTime.now()));
  }
}
