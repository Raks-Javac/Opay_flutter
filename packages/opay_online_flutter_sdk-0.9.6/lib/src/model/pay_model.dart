import 'dart:core';

import 'package:opay_online_flutter_sdk/src/model/user_model.dart';

class PayParams {
  String publicKey;
  String merchantId;
  String merchantName;
  String reference;
  String countryCode = "EG"; // 国家码 大写
  int payAmount; // 支付金额
  String currency; // 币种
  String productName;
  String productDescription;
  String callbackUrl;

  //optional
  String paymentType; // pay method
  int expireAt; // expire time(unit: minutes)
  String userClientIP;
  UserInfo? userInfo; //not must

  PayParams(String publicKey1,
      {this.publicKey = "",
      this.merchantId = "",
      this.merchantName = "",
      this.reference = "",
      this.countryCode = "",
      this.payAmount = 0,
      this.currency = "",
      this.productName = "",
      this.productDescription = "",
      this.callbackUrl = "",
      this.paymentType = "",
      this.expireAt = 30,
      this.userClientIP = "",
      this.userInfo});
}
