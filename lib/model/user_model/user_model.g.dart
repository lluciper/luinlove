// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      nameMan: json['nameMan'] as String?,
      birthDayMan: json['birthDayMan'] as String?,
      nameWomen: json['nameWomen'] as String?,
      birthDayWomen: json['birthDayWomen'] as String?,
      imageManUrl: json['imageManUrl'] as String?,
      imageWomenUrl: json['imageWomenUrl'] as String?,
      status: json['status'] as String?,
      dmy: json['dmy'] as String?,
      saveDate: json['saveDate'] as String?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'nameMan': instance.nameMan,
      'birthDayMan': instance.birthDayMan,
      'nameWomen': instance.nameWomen,
      'birthDayWomen': instance.birthDayWomen,
      'imageManUrl': instance.imageManUrl,
      'imageWomenUrl': instance.imageWomenUrl,
      'status': instance.status,
      'dmy': instance.dmy,
      'saveDate': instance.saveDate,
    };
