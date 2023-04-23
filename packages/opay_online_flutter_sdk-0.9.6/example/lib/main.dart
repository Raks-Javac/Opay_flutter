import 'package:example/order_params_editor_page.dart';
import 'package:example/status_params_editor_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:opay_online_flutter_sdk/opay_online_flutter_sdk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'OPay SDK Demo'),
      //home: WebViewPage(webUrl: "assets/html/test.html",isLocalUrl: true,),
      builder: EasyLoading.init(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _createOrderResult = '';
  String _getCashierStatusResult = '';
  bool _isDebug = OPayTask.isSandBox();
  String _currentEnv = OPayTask.isSandBox() ? "sandbox" : "release";
  //create order params
  var payParams = PayParams(
    "",
    publicKey: "OPAYPUB16*********633361",
    merchantId: "281821120675251",
    merchantName: "123456789",
    reference: "1182323221",
    countryCode: Country.egypt.countryCode,
    payAmount: 1000,
    currency: Country.egypt.currency,
    productName: "iPhone 13 pro max111",
    productDescription: "mai mai mai",
    callbackUrl: "http://www.baidu.com",
    paymentType: "",
    expireAt: 30,
    userClientIP: "1.11.111.111",
    //userInfo: UserInfo("1","11@bb.com","10101010","name"),
  );

  CashierStatusParam statusParam = CashierStatusParam(
      privateKey: "OPAYPRV1*********474",
      merchantId: "281821120675251",
      reference: "126",
      orderNo: "",
      countryCode: Country.egypt.countryCode);

  void _changeEnv() {
    OPayTask.setSandBox(!_isDebug);
    _isDebug = OPayTask.isSandBox();
    setState(() {
      _currentEnv = OPayTask.isSandBox() ? "sandbox" : "release";
    });
  }

  void _clickCreateOrder() {
    EasyLoading.show(status: "loading");
    OPayTask().createOrder(context, payParams, httpFinishedMethod: () {
      EasyLoading.dismiss();
    }).then((response) {
      // httpResponse （Just check the reason for the failure of the network request）
      setState(() {
        _createOrderResult = response.payHttpResponse.toJson((value) {
          if (value != null) {
            return value.toJson();
          }
          return null;
        }).toString();
        debugPrint("httpResult=$_createOrderResult");
      });

      // h5 Response （Payment result check ）
      if (response.webJsResponse != null) {
        var status = response.webJsResponse?.orderStatus;
        debugPrint("webJsResponse.status=$status");
        if (status != null) {
          EasyLoading.showToast(status, duration: const Duration(seconds: 5));
        }
        switch (status) {
          case PayResultStatus.initial:
            break;
          case PayResultStatus.pending:
            break;
          case PayResultStatus.success:
            break;
          case PayResultStatus.fail:
            break;
          case PayResultStatus.close:
            break;
        }
      }
    });
  }

  void _clickGetCashierStatus() {
    EasyLoading.show(status: "loading");
    OPayTask().getCashierStatus(statusParam).then((response) {
      EasyLoading.dismiss();
      OrderInfo? data = response.payHttpResponse.data; //get result data
      switch (data?.status) {
        case PayResultStatus.initial:
          break;
        case PayResultStatus.pending:
          break;
        case PayResultStatus.success:
          break;
        case PayResultStatus.fail:
          break;
        case PayResultStatus.close:
          break;
      }
      setState(() {
        _getCashierStatusResult = response.payHttpResponse.toJson((value) {
          if (value != null) {
            return value.toJson();
          }
          return null;
        }).toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 16),
              ),
              TextButton(
                onPressed: _changeEnv,
                child: Text(
                  'Change Env（$_currentEnv）',
                  style: const TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
              ),
              TextButton(
                onPressed: () async => {
                  payParams = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              OrderParamsEditorPage(payParams: payParams)))
                },
                child: const Text('Setting OrderParams'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFF43E3ff)),
                ),
              ),
              TextButton(
                onPressed: _clickCreateOrder,
                child: const Text('Create Order'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFF43E3B7)),
                ),
              ),
              Text(_createOrderResult),
              TextButton(
                onPressed: () async => {
                  statusParam = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              StatusParamsEditorPage(
                                  statusParams: statusParam)))
                },
                child: const Text('Setting Status Params'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFF43E3ff)),
                ),
              ),
              TextButton(
                onPressed: _clickGetCashierStatus,
                child: const Text('Get Cashier Status'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFF43E3B7)),
                ),
              ),
              Text(_getCashierStatusResult),
              const Padding(padding: EdgeInsets.only(bottom: 16)),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
