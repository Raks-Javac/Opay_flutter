

import 'package:json_annotation/json_annotation.dart';

part 'web_js_response.g.dart';
@JsonSerializable()
class WebJsResponse{
  String eventName;
  String orderStatus;
  String orderNo;
  String? payNo;
  String? merchantId;
  String merchantOrderNo;

  WebJsResponse(this.eventName,this.orderStatus,
      this.orderNo,this.payNo,this.merchantId,this.merchantOrderNo);

  factory WebJsResponse.fromJson(Map<String, dynamic> json) => _$WebJsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WebJsResponseToJson(this);

  @override
  String toString() {
    return "eventName=$eventName & orderStatus=$orderStatus"
        " & orderNo=$orderNo & payNo=$payNo & merchantId=$merchantId & merchantOrderNo=$merchantOrderNo";
  }
}