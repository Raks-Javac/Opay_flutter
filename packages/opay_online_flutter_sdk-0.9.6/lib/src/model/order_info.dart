
import 'package:json_annotation/json_annotation.dart';
import 'order_model.dart';

part  'order_info.g.dart';
@JsonSerializable()
class OrderInfo{
  String reference;
  String orderNo;
  String? cashierUrl;
  String status;
  PaymentAmount amount;
  String? failureReason;
  String? silence;
  String? hasRefund;
  VatInfo vat;

  OrderInfo(
      this.reference,
      this.orderNo,
      this.cashierUrl,
      this.status,
      this.amount,
      this.failureReason,
      this.silence,
      this.hasRefund,
      this.vat
      );

  factory OrderInfo.fromJson(Map<String, dynamic> json) => _$OrderInfoFromJson(json);

  Map<String, dynamic> toJson() => _$OrderInfoToJson(this);

}