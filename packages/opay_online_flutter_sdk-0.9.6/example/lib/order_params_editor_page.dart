
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opay_online_flutter_sdk/opay_online_flutter_sdk.dart';

class OrderParamsEditorPage extends StatefulWidget{


  PayParams payParams ;
  OrderParamsEditorPage({Key? key,required this.payParams}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _OrderParamsEditorPageState();
  }

}

class _OrderParamsEditorPageState extends State<OrderParamsEditorPage>{
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context,widget.payParams);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("setPaymentParams"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: TextEditingController.fromValue(
                      TextEditingValue(text: widget.payParams.publicKey)
                  ),
                  onChanged: (v){
                    widget.payParams.publicKey = v;
                  },
                  autofocus: false,
                  decoration: const InputDecoration(
                    labelText: "PublicKey",
                  ),

                ),
                TextField(
                    controller: TextEditingController.fromValue(
                        TextEditingValue(text: widget.payParams.merchantId)
                    ),
                    onChanged: (v){
                      widget.payParams.merchantId = v;
                    },
                    autofocus: false,
                    decoration: const InputDecoration(
                      labelText: "MerchantId",
                    )
                ),
                TextField(
                    controller: TextEditingController.fromValue(
                        TextEditingValue(text: widget.payParams.merchantName)
                    ),
                    onChanged: (v){
                      widget.payParams.merchantName = v;
                    },
                    autofocus: false,
                    decoration: const InputDecoration(
                      labelText: "MerchantName",
                    )
                ),
                TextField(
                    controller: TextEditingController.fromValue(
                        TextEditingValue(text: widget.payParams.reference)
                    ),
                    onChanged: (v){
                      widget.payParams.reference = v;
                    },
                    autofocus: false,
                    decoration: const InputDecoration(
                      labelText: "reference",
                    )
                ),
                TextField(
                    controller: TextEditingController.fromValue(
                        TextEditingValue(text: widget.payParams.countryCode)
                    ),
                    onChanged: (v){
                      widget.payParams.countryCode = v;
                    },
                    autofocus: false,
                    decoration: const InputDecoration(
                      labelText: "Country",
                    )
                ),
                TextField(
                    controller: TextEditingController.fromValue(
                        TextEditingValue(text: widget.payParams.currency)
                    ),
                    onChanged: (v){
                      widget.payParams.currency = v;
                    },
                    autofocus: false,
                    decoration: const InputDecoration(
                      labelText: "Currency",
                    )
                ),
                TextField(
                    controller: TextEditingController.fromValue(
                        TextEditingValue(text: widget.payParams.payAmount.toString())
                    ),
                    onChanged: (v){
                      widget.payParams.payAmount = int.parse(v);
                    },
                    autofocus: false,
                    decoration: const InputDecoration(
                      labelText: "Amount(total)",
                    )
                ),
                TextField(
                    controller: TextEditingController.fromValue(
                        TextEditingValue(text: widget.payParams.productName)
                    ),
                    onChanged: (v){
                      widget.payParams.productName = v;
                    },
                    autofocus: false,
                    decoration: const InputDecoration(
                      labelText: "Product(name)",
                    )
                ),
                TextField(
                    controller: TextEditingController.fromValue(
                        TextEditingValue(text: widget.payParams.productDescription)
                    ),
                    onChanged: (v){
                      widget.payParams.productDescription = v;
                    },
                    autofocus: false,
                    decoration: const InputDecoration(
                      labelText: "Product(description)",
                    )
                ),
                TextField(
                    controller: TextEditingController.fromValue(
                        TextEditingValue(text: widget.payParams.callbackUrl)
                    ),
                    onChanged: (v){
                      widget.payParams.callbackUrl = v;
                    },
                    autofocus: false,
                    decoration: const InputDecoration(
                      labelText: "callbackUrl",
                    )
                ),
                TextField(
                    controller: TextEditingController.fromValue(
                        TextEditingValue(text: widget.payParams.userClientIP)
                    ),
                    onChanged: (v){
                      widget.payParams.userClientIP = v;
                    },
                    autofocus: false,
                    decoration: const InputDecoration(
                      labelText: "userClientIP",
                    )
                ),
                TextField(
                    controller: TextEditingController.fromValue(
                        TextEditingValue(text: widget.payParams.expireAt.toString())
                    ),
                    onChanged: (v){
                      widget.payParams.expireAt = int.parse(v);
                    },
                    autofocus: false,
                    decoration: const InputDecoration(
                      labelText: "expireAt(int)",
                    )
                ),
                TextField(
                    controller: TextEditingController.fromValue(
                        TextEditingValue(text: widget.payParams.paymentType)
                    ),
                    onChanged: (v){
                      widget.payParams.paymentType = v;
                    },
                    autofocus: false,
                    decoration: const InputDecoration(
                      labelText: "paymentMethod",
                    )
                ),
                const Padding(padding: EdgeInsets.only(bottom: 16)),

              ],
            ),
          ),
        ),
      ),
    );
  }

}