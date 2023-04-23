
part of 'order_info.dart';

OrderInfo _$OrderInfoFromJson(Map<String, dynamic> json) => OrderInfo(
  json['reference'] as String,
  json['orderNo'] as String,
  json['cashierUrl'] as String?,
  json['status'] as String,
  PaymentAmount.fromJson(json['amount'] as Map<String, dynamic>),
  json['failureReason'] as String?,
  json['silence'] as String?,
  json['hasRefund'] as String?,
  VatInfo.fromJson(json['vat'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OrderInfoToJson(OrderInfo instance) => <String, dynamic>{
  'reference': instance.reference,
  'orderNo': instance.orderNo,
  'cashierUrl': instance.cashierUrl,
  'status': instance.status,
  'amount': instance.amount.toJson(),
  'failureReason': instance.failureReason,
  'silence': instance.silence,
  'hasRefund': instance.hasRefund,
  'vat': instance.vat.toJson(),
};