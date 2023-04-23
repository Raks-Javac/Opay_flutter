import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opay_online_flutter_sdk/opay_online_flutter_sdk.dart';

abstract class OpayAbstractHandler {
  Future initializePayment({
    required PayParams paymentParams,
    required Function(OPayResponse response) initialState,
    required Function(OPayResponse response) pending,
    required Function(OPayResponse response) onSuccess,
    required Function(OPayResponse response) onFailed,
    required Function(OPayResponse response) onClose,
    required Function() onError,
  });
}

class OpayGateway implements OpayAbstractHandler {
  OpayGateway._privateConstructor();

  static OpayGateway instance = OpayGateway._privateConstructor();

  GlobalKey<NavigatorState> opayNavigatorKey = GlobalKey<NavigatorState>();
  @override
  initializePayment({
    required PayParams paymentParams,
    required Function(OPayResponse response) initialState,
    required Function(OPayResponse response) pending,
    required Function(OPayResponse response) onSuccess,
    required Function(OPayResponse response) onFailed,
    required Function(OPayResponse response) onClose,
    required Function() onError,
  }) async {
    try {
      await OPayTask()
          .createOrder(opayNavigatorKey.currentContext!, paymentParams,
              httpFinishedMethod: () {})
          .then((response) {
        //httpResponse （Just check the reason for the failure of the network request）
        String createOrderResult = response.payHttpResponse.toJson((value) {
          if (value != null) {
            return value.toJson();
          }
          return null;
        }).toString();
        debugPrint("httpResult=$createOrderResult");
        //  Response （Payment result check ）
        if (response.webJsResponse != null) {
          var status = response.webJsResponse?.orderStatus;
          debugPrint("webJsResponse.status=$status");
          if (status != null) {
            //
          }
          switch (status) {
            case PayResultStatus.initial:
              initialState(response);
              break;
            case PayResultStatus.pending:
              pending(response);
              break;
            case PayResultStatus.success:
              onSuccess(response);
              break;
            case PayResultStatus.fail:
              onFailed(response);
              break;
            case PayResultStatus.close:
              onClose(response);
              break;
          }
        }
      });
    } catch (e) {
      debugPrint(e.toString());
      onError();
    }
  }
}

class CustomDisplay {
  //loader

  static void loading() {
    showCupertinoDialog(
        context: OpayGateway.instance.opayNavigatorKey.currentContext!,
        builder: (context) {
          return Scaffold(
            backgroundColor:
                Theme.of(context).scaffoldBackgroundColor.withOpacity(0.4),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CupertinoActivityIndicator(),
                SizedBox(
                  height: 10,
                ),
                Center(child: Text("loading")),
              ],
            ),
          );
        });
  }

  static void stopLoading() {
    Navigator.pop(OpayGateway.instance.opayNavigatorKey.currentContext!);
  }

//dialog message

  dialogMessage(BuildContext comtext) {}
}
