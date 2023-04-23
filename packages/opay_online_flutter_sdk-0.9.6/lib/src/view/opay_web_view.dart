
// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:opay_online_flutter_sdk/src/model/web_js_response.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OPayWebView extends StatefulWidget{

  String webUrl;
  bool isLocalUrl;
  Function(WebJsResponse?)? backIconFunc;



  OPayWebView({Key? key, this.webUrl="",this.isLocalUrl=false,this.backIconFunc}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _OPayWebView();
  }
}

class _OPayWebView extends State<OPayWebView>{

  int _currentProgress=0;
  WebViewController? _webViewController;

  _OPayWebView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: _buildBody()
    );
  }

  @override
  void dispose(){
    super.dispose();
    _webViewController = null;

  }


  Visibility _linearProgressIndicator(){
    return Visibility(
        visible: _currentProgress<100,
        child: LinearProgressIndicator(
          value: _currentProgress/100.0, // 当前进度
          backgroundColor: const Color(0xFFEEEEEE), // 进度条背景色
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.red), // 进度条当前进度颜色
          minHeight: 4, // 最小宽度
        ));
  }

  _buildBody() {
    return Column(

      children: <Widget>[
        const SizedBox(
          height: 1,
          width: double.infinity,
          child: DecoratedBox(decoration: BoxDecoration(color: Color(0xFFEEEEEE))),
        ),
        _linearProgressIndicator(),
        Expanded(
          flex: 1,
          child: WebView(
            debuggingEnabled: false,
            zoomEnabled:false,
            initialUrl: widget.isLocalUrl ? Uri.dataFromString(widget.webUrl, mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
                .toString(): widget.webUrl,
            javascriptMode: JavascriptMode.unrestricted,
            javascriptChannels: <JavascriptChannel>{
              _clickResultOKBtn(context),
              _clickResultCancelBtn(context),
              _clickReferenceCodeReturnBtn(context)
            },
            navigationDelegate: (NavigationRequest request) {
              debugPrint(request.url);
              if(!request.url.startsWith("http")){
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
            onWebViewCreated: (WebViewController controller){
              _webViewController = controller;
              if(widget.isLocalUrl){
                _loadHtmlAssets(controller);
              }else{
                controller.loadUrl(widget.webUrl);
              }
              controller.canGoBack().then((value) => debugPrint(value.toString()));
              controller.canGoForward().then((value) => debugPrint(value.toString()));
              controller.currentUrl().then((value) => debugPrint(value));
            },
            onProgress: (int progress){
              setState(() {
                _currentProgress = progress;
              });
            },
            onPageFinished: (String value){

            },
          ),
        )
      ],
    );
  }


  //加载本地文件
  _loadHtmlAssets(WebViewController controller) async {
    String htmlPath = await rootBundle.loadString(widget.webUrl);
    controller.loadUrl(Uri.dataFromString(htmlPath,mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  _finishPage(WebJsResponse? webJsResponse){
    if(widget.backIconFunc!=null){
      widget.backIconFunc!(webJsResponse);
    }
  }

  JavascriptChannel _clickResultOKBtn(BuildContext context) => JavascriptChannel(
      name: 'clickResultOKBtn', // 与h5 端的一致 不然收不到消息
      onMessageReceived: (JavascriptMessage message) async{
        String resultMsg = message.message;
        Map<String,dynamic> map = json.decode(resultMsg);
        WebJsResponse response = WebJsResponse.fromJson(map);
        _finishPage(response);
      });

  JavascriptChannel _clickResultCancelBtn(BuildContext context) => JavascriptChannel(
      name: 'clickResultCancelBtn', // 与h5 端的一致 不然收不到消息
      onMessageReceived: (JavascriptMessage message) async{
        String resultMsg = message.message;
        Map<String,dynamic> map = json.decode(resultMsg);
        WebJsResponse response = WebJsResponse.fromJson(map);
        _finishPage(response);
      });

  JavascriptChannel _clickReferenceCodeReturnBtn(BuildContext context) => JavascriptChannel(
      name: 'clickReferenceCodeReturnBtn', // 与h5 端的一致 不然收不到消息
      onMessageReceived: (JavascriptMessage message) async{
        String resultMsg = message.message;
        Map<String,dynamic> map = json.decode(resultMsg);
        WebJsResponse response = WebJsResponse.fromJson(map);
        _finishPage(response);
      });

}