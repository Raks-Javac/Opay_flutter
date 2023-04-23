// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      json['userId'] as String,
      json['userEmail'] as String,
      json['userMobile'] as String,
      json['userName'] as String,
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'userEmail': instance.userEmail,
      'userId': instance.userId,
      'userMobile': instance.userMobile,
      'userName': instance.userName,
    };
