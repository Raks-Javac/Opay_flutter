// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayHttpResponse<T> _$PayHttpResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PayHttpResponse<T>(
      $enumDecode(_$ResponseStatusEnumMap, json['status']),
      json['code'] as String,
      json['message'] as String,
      fromJsonT(json['data']),
    );

Map<String, dynamic> _$PayHttpResponseToJson<T>(
  PayHttpResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status': _$ResponseStatusEnumMap[instance.status],
      'data': toJsonT(instance.data),
      'code': instance.code,
      'message': instance.message,
    };

const _$ResponseStatusEnumMap = {
  ResponseStatus.success: 'success',
  ResponseStatus.error: 'error',
};
