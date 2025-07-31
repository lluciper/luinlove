part of 'home_cubit.dart';

@immutable
class HomeState extends Equatable {
  const HomeState({
    this.saveDate,
    this.changeDate,
    this.information,
    this.path,
  });

  final DateTime? saveDate;
  final DateTime? changeDate;
  final UserModel? information;
  final String? path;

  HomeState copyWith({
    DateTime? saveDate,
    DateTime? changeDate,
    UserModel? information,
    String? path,
  }) {
    return HomeState(
      saveDate: saveDate ?? this.saveDate,
      changeDate: changeDate ?? this.changeDate,
      information: information ?? this.information,
      path: path ?? this.path,
    );
  }

  @override
  List<Object?> get props => [
        saveDate,
        changeDate,
        information,
        path,
      ];
}
