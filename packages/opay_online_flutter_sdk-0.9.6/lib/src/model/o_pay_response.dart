
import 'package:opay_online_flutter_sdk/src/model/response.dart';
import 'package:opay_online_flutter_sdk/src/model/web_js_response.dart';

class OPayResponse{

  PayHttpResponse payHttpResponse;//Just check the reason for the failure of the network request
  WebJsResponse? webJsResponse;//Payment result check

  OPayResponse({required this.payHttpResponse,this.webJsResponse});
}