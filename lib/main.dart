import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:opay_flutter/opay_handler.dart';
import 'package:opay_flutter/sample_home.dart';
import 'package:opay_online_flutter_sdk/opay_online_flutter_sdk.dart';

void main() async {
  runApp(const MyApp());
  await dotenv.load(fileName: ".env");
  OPayTask.setSandBox(true);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Opay Flutter',
      navigatorKey: OpayGateway.instance.opayNavigatorKey,
      theme: ThemeData(primaryColor: appColor),
      home: const SampleHomeUI(),
    );
  }
}
