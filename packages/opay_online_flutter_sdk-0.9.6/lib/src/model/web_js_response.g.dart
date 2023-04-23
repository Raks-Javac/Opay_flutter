// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_js_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebJsResponse _$WebJsResponseFromJson(Map<String, dynamic> json) =>
    WebJsResponse(
      json['eventName'] as String,
      json['orderStatus'] as String,
      json['orderNo'] as String,
      json['payNo'] as String?,
      json['merchantId'] as String?,
      json['merchantOrderNo'] as String,
    );

Map<String, dynamic> _$WebJsResponseToJson(WebJsResponse instance) =>
    <String, dynamic>{
      'eventName': instance.eventName,
      'orderStatus': instance.orderStatus,
      'orderNo': instance.orderNo,
      'payNo': instance.payNo,
      'merchantId': instance.merchantId,
      'merchantOrderNo': instance.merchantOrderNo,
    };
