// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderRequest _$OrderRequestFromJson(Map<String, dynamic> json) => OrderRequest(
      json['merchantName'] as String,
      json['country'] as String,
      json['reference'] as String,
      PaymentAmount.fromJson(json['amount'] as Map<String, dynamic>),
      Product.fromJson(json['product'] as Map<String, dynamic>),
      json['returnUrl'] as String,
      json['callbackUrl'] as String,
      json['cancelUrl'] as String,
      json['userClientIP'] as String,
      json['expireAt'] as int,
      json['payMethod'] as String,
      json['userInfo'] == null
          ? null
          : UserInfo.fromJson(json['userInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderRequestToJson(OrderRequest instance) =>
    <String, dynamic>{
      'merchantName': instance.merchantName,
      'country': instance.country,
      'reference': instance.reference,
      'amount': instance.amount,
      'product': instance.product,
      'returnUrl': instance.returnUrl,
      'callbackUrl': instance.callbackUrl,
      'cancelUrl': instance.cancelUrl,
      'userClientIP': instance.userClientIP,
      'expireAt': instance.expireAt,
      'payMethod': instance.payMethod,
       'userInfo':instance.userInfo?.toJson()

    };

PaymentAmount _$PaymentAmountFromJson(Map<String, dynamic> json) =>
    PaymentAmount(
      json['total'] as int,
      json['currency'] as String,
    );

Map<String, dynamic> _$PaymentAmountToJson(PaymentAmount instance) =>
    <String, dynamic>{
      'total': instance.total,
      'currency': instance.currency,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      json['name'] as String,
      json['description'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
    };

VatInfo _$VatInfoFromJson(Map<String, dynamic> json) => VatInfo(
      json['total'] as int?,
      json['currency'] as String?,
      json['rate'] as int?,
      json['currencySymbo'] as String?,
    );

Map<String, dynamic> _$VatInfoToJson(VatInfo instance) => <String, dynamic>{
      'total': instance.total,
      'currency': instance.currency,
      'rate': instance.rate,
      'currencySymbo': instance.currencySymbo,
    };
