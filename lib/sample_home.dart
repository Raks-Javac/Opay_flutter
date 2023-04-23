import 'package:flutter/material.dart';
import 'package:opay_flutter/opay_handler.dart';
import 'package:opay_online_flutter_sdk/opay_online_flutter_sdk.dart';

const Color appColor = Color(0xFF20c997);

class SampleHomeUI extends StatefulWidget {
  const SampleHomeUI({super.key});

  @override
  State<SampleHomeUI> createState() => _SampleHomeUIState();
}

class _SampleHomeUIState extends State<SampleHomeUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Opay with flutter"),
        centerTitle: true,
        backgroundColor: appColor,
      ),
      body: Center(
        child: ElevatedButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(appColor)),
          onPressed: () async {
            CustomDisplay.loading();
            String apiKey = "[API_KEY]";
            String merchantID = "[MECHANT_ID]";
            String referenceNumber = "[CUSTOM_PAYMENT_REF]";
            String merchantName = "[MECHANT_NAME]";

//available payment types

// BankAccount

// BankTransfer

// BankUssd

// OpayWalletNg

// BankCard

// OpayWalletNgQR

// ReferenceCode

            PayParams paymentPayload = PayParams(
              apiKey,
              publicKey: apiKey, // your public key
              merchantId: merchantID,
              merchantName: merchantName,
              reference: referenceNumber,
              countryCode: Country.egypt.countryCode,
              payAmount: 5000,
              currency: Country.egypt.currency,
              productName: "Flutter opay",
              productDescription: "Testing flutter opay",
              callbackUrl: "[Your web url here]",
              paymentType: "",

              expireAt: 30,
              userClientIP: "[your custom IP]",
              // optional
              //optional
              // userInfo = "",
            );
            await OpayGateway.instance.initializePayment(
              paymentParams: paymentPayload,
              initialState: (OPayResponse? initialState) {},
              pending: (OPayResponse? pending) {},
              onClose: (OPayResponse response) {},
              onFailed: (OPayResponse response) {},
              onSuccess: (OPayResponse response) {},
              onError: () {},
            );
            CustomDisplay.stopLoading();
          },
          child: const Text("Pay with Opay"),
        ),
      ),
    );
  }
}
