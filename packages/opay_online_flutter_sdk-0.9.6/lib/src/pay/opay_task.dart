import 'dart:convert' as json_convert;

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:opay_online_flutter_sdk/opay_online_flutter_sdk.dart';
import 'package:opay_online_flutter_sdk/src/http/http_manager.dart';
import 'package:opay_online_flutter_sdk/src/http/http_status.dart';
import 'package:opay_online_flutter_sdk/src/model/order_model.dart';
import 'package:opay_online_flutter_sdk/src/model/request.dart';
import 'package:opay_online_flutter_sdk/src/model/web_js_response.dart';
import 'package:opay_online_flutter_sdk/src/page/webviewpage.dart';

class OPayTask {
  OPayTask();

  final _defaultUrl = "https://www.opaycheckout.com/";
  final _createOrderUrl = "/api/v1/international/cashier/create";
  final _cashierStatus = "/api/v1/international/cashier/status";

  Future<OPayResponse> createOrder(BuildContext context, PayParams params,
      {Function()? httpFinishedMethod}) async {
    var requestParams = OrderRequest(
        params.merchantName,
        params.countryCode.toUpperCase(),
        params.reference,
        PaymentAmount(params.payAmount, params.currency),
        Product(params.productName, params.productDescription),
        _defaultUrl,
        params.callbackUrl,
        _defaultUrl,
        params.userClientIP,
        params.expireAt,
        params.paymentType,
        params.userInfo);

    var headers = RequestHeader(params.merchantId, params.publicKey); //
    Map<String, dynamic> map = requestParams.toJson();
    var response = await HttpManager()
        .post(_createOrderUrl, headers, map, params.countryCode.toUpperCase());
    if (httpFinishedMethod != null) {
      httpFinishedMethod.call();
    }
    WebJsResponse? webResult;
    if (response.status == ResponseStatus.success) {
      OrderInfo? orderInfo = response.data;
      String? cashierUrl = orderInfo?.cashierUrl;
      if (cashierUrl!.isNotEmpty) {
        //去webview页面支付
        webResult = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    WebViewPage(webUrl: cashierUrl)));
      }
    }
    return OPayResponse(payHttpResponse: response, webJsResponse: webResult);
  }

  Future<OPayResponse> getCashierStatus(CashierStatusParam params) async {
    var requestParams = CashierStatusRequest(
        params.countryCode.toUpperCase(), params.orderNo, params.reference);

    var jsonStr = json_convert.jsonEncode(requestParams.toJson());
    var hMacSha256 = Hmac(sha512, json_convert.utf8.encode(params.privateKey));
    var digest = hMacSha256.convert(json_convert.utf8.encode(jsonStr));
    StringBuffer stringBuffer = StringBuffer();
    for (int item in digest.bytes) {
      stringBuffer
          .write(((item & 0xFF) | 0x100).toRadixString(16).substring(1, 3));
    }
    var publicKey = stringBuffer.toString().toLowerCase();
    var header = RequestHeader(params.merchantId, publicKey);
    var response = await HttpManager().post(_cashierStatus, header,
        requestParams.toJson(), params.countryCode.toUpperCase());
    return OPayResponse(payHttpResponse: response);
  }

  static bool _sandBox = true;

  static void setSandBox(bool isSandBox) {
    _sandBox = isSandBox;
  }

  static bool isSandBox() {
    return _sandBox;
  }
}
