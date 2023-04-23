
import 'package:json_annotation/json_annotation.dart';

part 'cashier_model.g.dart';

class CashierStatusParam{
  String privateKey;// 商户key
  String merchantId;// 商户key
  String reference;
  String orderNo;
  String countryCode;// 国家码  大写

  CashierStatusParam(
    {this.privateKey="",this.merchantId="",this.reference="",this.orderNo="",this.countryCode=""}
      );
}


@JsonSerializable()
class CashierStatusRequest{
  String country;
  String orderNo;
  String reference;

  CashierStatusRequest(this.country,this.orderNo,this.reference);

  factory CashierStatusRequest.fromJson(Map<String, dynamic> json) => _$CashierStatusRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CashierStatusRequestToJson(this);
}