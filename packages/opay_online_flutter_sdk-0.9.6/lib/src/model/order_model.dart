
import 'dart:core';
import 'package:json_annotation/json_annotation.dart';

import 'country.dart';
import 'user_model.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderRequest{
  String merchantName;
  String country;
  String reference;
  PaymentAmount amount;
  Product product;
  String returnUrl;
  String callbackUrl;
  String cancelUrl;
  String userClientIP;
  int expireAt = 0;
  String payMethod;
  UserInfo? userInfo;

  OrderRequest(
      this.merchantName,
      this.country,
      this.reference,
      this.amount,
      this.product,
      this.returnUrl,
      this.callbackUrl,
      this.cancelUrl,
      this.userClientIP,
      this.expireAt,
      this.payMethod,
      this.userInfo
  );
  factory OrderRequest.fromJson(Map<String, dynamic> json) => _$OrderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OrderRequestToJson(this);

}

@JsonSerializable()
class PaymentAmount{
  int total;
  String currency=Country.nigeria.currency;
  PaymentAmount(
      this.total,
      this.currency
      );

  factory PaymentAmount.fromJson(Map<String, dynamic> json) => _$PaymentAmountFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentAmountToJson(this);
}
@JsonSerializable()
class Product{
  String name;
  String description;
  Product(this.name,this.description);

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class VatInfo{
  int? total = 0 ;
  String? currency;
  int? rate = 0 ;
  String? currencySymbo;

  VatInfo(
      this.total,
      this.currency,
      this.rate,
      this.currencySymbo
      );
  factory VatInfo.fromJson(Map<String, dynamic> json) => _$VatInfoFromJson(json);

  Map<String, dynamic> toJson() => _$VatInfoToJson(this);
}
