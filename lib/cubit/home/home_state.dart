part of 'home_cubit.dart';

@immutable
class HomeState extends Equatable {
  const HomeState({
    this.saveDate,
    this.changeDate,
    this.information,
  });

  final DateTime? saveDate;
  final DateTime? changeDate;
  final UserModel? information;

  HomeState copyWith({
    DateTime? saveDate,
    DateTime? changeDate,
    UserModel? information,
  }) {
    return HomeState(
      saveDate: saveDate ?? this.saveDate,
      changeDate: changeDate ?? this.changeDate,
      information: information ?? this.information,
    );
  }

  @override
  List<Object?> get props => [
        saveDate,
        changeDate,
        information,
      ];
}
