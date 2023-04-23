// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashier_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CashierStatusRequest _$CashierStatusRequestFromJson(
        Map<String, dynamic> json) =>
    CashierStatusRequest(
      json['country'] as String,
      json['orderNo'] as String,
      json['reference'] as String,
    );

Map<String, dynamic> _$CashierStatusRequestToJson(
        CashierStatusRequest instance) =>
    <String, dynamic>{
      'country': instance.country,
      'orderNo': instance.orderNo,
      'reference': instance.reference,
    };
