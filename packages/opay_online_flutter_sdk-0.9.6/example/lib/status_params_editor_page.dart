
import 'package:flutter/material.dart';
import 'package:opay_online_flutter_sdk/opay_online_flutter_sdk.dart';

// ignore: must_be_immutable
class StatusParamsEditorPage extends StatefulWidget{


  CashierStatusParam statusParams ;
  StatusParamsEditorPage({Key? key,required this.statusParams}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _StatusParamsEditorPageState();
  }

}

class _StatusParamsEditorPageState extends State<StatusParamsEditorPage>{

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context,widget.statusParams);
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
                      TextEditingValue(text: widget.statusParams.privateKey)
                  ),
                  onChanged: (v){
                    widget.statusParams.privateKey = v;
                  },
                  autofocus: false,
                  decoration: const InputDecoration(
                    labelText: "PrivateKey",
                  ),

                ),
                TextField(
                    controller: TextEditingController.fromValue(
                        TextEditingValue(text: widget.statusParams.merchantId)
                    ),
                    onChanged: (v){
                      widget.statusParams.merchantId = v;
                    },
                    autofocus: false,
                    decoration: const InputDecoration(
                      labelText: "MerchantId",
                    )
                ),
                TextField(
                    controller: TextEditingController.fromValue(
                        TextEditingValue(text: widget.statusParams.orderNo)
                    ),
                    onChanged: (v){
                      widget.statusParams.orderNo = v;
                    },
                    autofocus: false,
                    decoration: const InputDecoration(
                      labelText: "orderNo",
                    )
                ),
                TextField(
                    controller: TextEditingController.fromValue(
                        TextEditingValue(text: widget.statusParams.reference)
                    ),
                    onChanged: (v){
                      widget.statusParams.reference = v;
                    },
                    autofocus: false,
                    decoration: const InputDecoration(
                      labelText: "reference",
                    )
                ),
                TextField(
                    controller: TextEditingController.fromValue(
                        TextEditingValue(text: widget.statusParams.countryCode)
                    ),
                    onChanged: (v){
                      widget.statusParams.countryCode = v;
                    },
                    autofocus: false,
                    decoration: const InputDecoration(
                      labelText: "Country",
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