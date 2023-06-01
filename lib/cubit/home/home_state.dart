part of 'home_cubit.dart';

@immutable
class HomeState extends Equatable {
  const HomeState({
     this.saveDate,
     this.changeDate,
  });

  final DateTime? saveDate;
  final DateTime? changeDate;

  HomeState copyWith({
    DateTime? saveDate,
    DateTime? changeDate,
  }) {
    return HomeState(
      saveDate: saveDate ?? this.saveDate,
      changeDate: changeDate ?? this.changeDate,
    );
  }

  @override
  List<Object?> get props => [
        saveDate,
        changeDate,
      ];
}
