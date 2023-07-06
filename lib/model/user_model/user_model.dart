import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    String? nameMan,
    String? birthDayMan,
    String? nameWomen,
    String? birthDayWomen,
    String? imageManUrl,
    String? imageWomenUrl,
    String? status,
    String? dmy,
    String? saveDate,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
