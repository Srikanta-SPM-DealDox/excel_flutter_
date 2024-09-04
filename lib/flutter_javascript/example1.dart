// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_js/flutter_js.dart';
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// void runJs()async{
//   JavascriptRuntime runtime = getJavascriptRuntime();
//   var file= await rootBundle.loadString('assets/custom.js');
//   JsEvalResult jsEvalResult = runtime.evaluate("""${file}addNumbers(${1},${2})""");
// }
//
// class WebViewExample extends StatefulWidget {
//   const WebViewExample({super.key});
//
//   @override
//   WebViewExampleState createState() => WebViewExampleState();
// }
//
// class WebViewExampleState extends State<WebViewExample> {
//   late WebViewController _controller;
//
//   @override
//   void initState() {
//     _controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted);
//     WidgetsBinding.instance.addPostFrameCallback((timeS)async{
//       String fileText = await rootBundle.loadString('assets/myindex.html');
//       _controller.loadRequest(Uri.dataFromString(fileText,mimeType: 'text/html'));
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // WebViewWidget(controller: _controller,);
//     return Column(
//       children: [
//         Expanded(
//           child: WebViewWidget(
//             controller: _controller,
//           ),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             final selectedDocument = {
//               "template_file": "https://cdn.filestackcontent.com/VfPTveQ0QbqadoLXETi8",
//               "doc_name": "your_doc_name",
//             };
//             // final jsonString = selectedDocument;
//             final jsCode = "handleDownloadWord(${jsonEncode(selectedDocument)})";
//             _controller.runJavaScript(jsCode).then((result) {
//               if (kDebugMode) {
//                 print('JavaScript executed successfully:');
//               }
//             }).catchError((error) {
//               if (kDebugMode) {
//                 print('Error executing JavaScript: $error');
//               }
//             });
//           },
//           child: const Text("Download Word Document"),
//         ),
//       ],
//     );
//   }
//
//   Future<void> _loadHtmlFromAssets() async {
//     String fileText = await rootBundle.loadString('assets/myindex.html');
//     _controller.loadRequest(Uri.dataFromString(
//       fileText,
//       mimeType: 'text/html',
//       encoding: Encoding.getByName('utf-8'),
//     ));
//     //   String fileText = await rootBundle.loadString('assets/index.html');
//     //   _controller.loadUrl(Uri.dataFromString(
//     //     fileText,
//     //     mimeType: 'text/html',
//     //     encoding: Encoding.getByName('utf-8'),
//     //   ).toString());
//   }
// }
