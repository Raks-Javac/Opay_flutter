import 'dart:convert';
import 'dart:io';

import 'package:opay_online_flutter_sdk/opay_online_flutter_sdk.dart';
import 'package:opay_online_flutter_sdk/src/model/response.dart';

import '../model/request.dart';
import 'http_status.dart';

class HttpManager {
  static HttpClient? _client;
  final String debugUrl = "https://sandboxapi.opaycheckout.com";
  final String releaseUrl = "https://api.opaycheckout.com";

  //尼日和其他地区的域名
  final String ngOrOtherSandBoxHostUrl = "testapi.opaycheckout.com";
  final String ngOrOtherReleaseHostUrl = "liveapi.opaycheckout.com";

  //埃及地区的域名
  final String sandBoxHostUrl = "sandboxapi.opaycheckout.com";
  final String releaseHostUrl = "api.opaycheckout.com";

  HttpManager() {
    if (_client == null) {
      _client = HttpClient();
      _client?.connectionTimeout = const Duration(minutes: 1);
      _client?.idleTimeout = const Duration(minutes: 1);
    }
  }

  String _getHostUrl(String countryCode) {
    if ("EG" == countryCode) {
      return OPayTask.isSandBox() ? sandBoxHostUrl : releaseHostUrl;
    }
    print(sandBoxHostUrl);
    return OPayTask.isSandBox()
        ? ngOrOtherSandBoxHostUrl
        : ngOrOtherReleaseHostUrl;
  }

  Future<PayHttpResponse<OrderInfo?>> post(String url,
      RequestHeader requestHeader, Map params, String countryCode) async {
    print(url);
    Uri uri = Uri.https(_getHostUrl(countryCode), url);
    HttpClientRequest? request = await _client?.postUrl(uri);
    String clientSource = "AndroidSDK";
    if (Platform.isIOS) {
      clientSource = "IOSSDK";
    }

    request?.headers.add("Content-Type", "application/json; utf-8");
    request?.headers.add("Authorization", "Bearer ${requestHeader.publicKey}");
    request?.headers.add("MerchantId", requestHeader.merchantId);
    request?.headers.add("ClientSource", clientSource);
    request?.add(utf8.encode(json.encode(params)));
    HttpClientResponse? response = await request?.close();
    if (response?.statusCode == 200) {
      String? body = await response?.transform(utf8.decoder).join();
      if (body != null) {
        Map<String, dynamic> map = jsonDecode(body);
        if (map["code"] == "00000" && map["data"] != null) {
          OrderInfo orderInfo = OrderInfo.fromJson(map["data"]);
          return PayHttpResponse(
              ResponseStatus.success, map["code"], map["message"], orderInfo);
        } else {
          return PayHttpResponse(
              ResponseStatus.error, map["code"], map["message"], null);
        }
      } else {
        return PayHttpResponse(
            ResponseStatus.error,
            (response?.statusCode == null ? 0 : response!.statusCode)
                .toString(),
            "Network error",
            null);
      }
    } else {
      return PayHttpResponse(
          ResponseStatus.error,
          (response?.statusCode == null ? 0 : response!.statusCode).toString(),
          "Network error",
          null);
    }
  }
}
