// import 'dart:convert';
// import 'dart:io';
// import 'dart:developer';
// import 'package:docx_template/docx_template.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf/widgets.dart' as w;
// import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;
// import 'package:permission_handler/permission_handler.dart';
// import 'package:pulgin_testing/main.dart';
//
// String token ="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NjVkY2U2MGIzOGYwYTRhMjNkNzFiYmYiLCJpYXQiOjE3MjA3ODA0MjEsImV4cCI6MTcyMTAzOTYyMX0.v70WdIthcdYEX6wjDIxQUamQHB0DmdjKsc0ant4lt-k";
// class MyDocx extends StatefulWidget {
//   const MyDocx({super.key});
//
//   @override
//   State<MyDocx> createState() => _MyDocxState();
// }
//
// class _MyDocxState extends State<MyDocx> {
//   bool isSelected = false;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: IconButton(
//             onPressed: () async {
//               // setState(()=>isSelected=!isSelected);
//               await modifyDocx();
//             },
//             icon: const Icon(Icons.clear_rounded),
//             isSelected: isSelected,
//             selectedIcon: const Icon(FontAwesomeIcons.zhihu),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<void> modifyDocx() async {
//     await requestStoragePermission();
//
//     // Load the DOCX template from assets
//     final data = await rootBundle.load('assets/documents/template.docx');
//     final bytes = Uint8List.fromList(data.buffer.asUint8List());
//     // print(bytes.toString());
//     final docx = await DocxTemplate.fromBytes(bytes);
//     print(docx.getTags());
//     // Load test image for inserting in docx
//     final testImageData = await rootBundle.load('assets/documents/test.jpg');
//     final testFileContent = testImageData.buffer.asUint8List();
//
//     final listNormal = ['Foo', 'Bar', 'Baz'];
//     final listBold = ['ooF', 'raB', 'zaB'];
//
//     final contentList = <Content>[];
//
//     final b = listBold.iterator;
//     for (var n in listNormal) {
//       b.moveNext();
//
//       final c = PlainContent("value")
//         ..add(TextContent("normal", n))
//         ..add(TextContent("bold", b.current));
//       contentList.add(c);
//     }
//
//     Content c = Content();
//     c
//       ..add(TextContent("docname", "<H1>hi</H1>"))
//       ..add(TextContent("passport", "Passport NE0323 4456673"))
//       ..add(TableContent("table", [
//         RowContent()
//           ..add(TextContent("key1", "Paul"))
//           ..add(TextContent("key2", "Viberg"))
//           ..add(TextContent("key3", "Engineer"))
//           ..add(ImageContent('img', testFileContent)),
//         RowContent()
//           ..add(TextContent("key1", "Alex"))
//           ..add(TextContent("key2", "Houser"))
//           ..add(TextContent("key3", "CEO & Founder"))
//           ..add(ListContent("tablelist", [
//             TextContent("value", "Mercedes-Benz C-Class S205"),
//             TextContent("value", "Lexus LX 570")
//           ]))
//           ..add(ImageContent('img', testFileContent))
//       ]))
//       ..add(ListContent("list", [
//         TextContent("value", "Engine")
//           ..add(ListContent("listnested", contentList)),
//         TextContent("value", "Gearbox"),
//         TextContent("value", "Chassis")
//       ]))
//       ..add(ListContent("plainlist", [
//         PlainContent("plainview")
//           ..add(TableContent("table", [
//             RowContent()
//               ..add(TextContent("key1", "Paul"))
//               ..add(TextContent("key2", "Viberg"))
//               ..add(TextContent("key3", "Engineer")),
//             RowContent()
//               ..add(TextContent("key1", "Alex"))
//               ..add(TextContent("key2", "Houser"))
//               ..add(TextContent("key3", "CEO & Founder"))
//               ..add(ListContent("tablelist", [
//                 TextContent("value", "Mercedes-Benz C-Class S205"),
//                 TextContent("value", "Lexus LX 570")
//               ]))
//           ])),
//         PlainContent("plainview")
//           ..add(TableContent("table", [
//             RowContent()
//               ..add(TextContent("key1", "Nathan"))
//               ..add(TextContent("key2", "Anceaux"))
//               ..add(TextContent("key3", "Music artist"))
//               ..add(ListContent(
//                   "tablelist", [TextContent("value", "Peugeot 508")])),
//             RowContent()
//               ..add(TextContent("key1", "Louis"))
//               ..add(TextContent("key2", "Houplain"))
//               ..add(TextContent("key3", "Music artist"))
//               ..add(ListContent("tablelist", [
//                 TextContent("value", "Range Rover Velar"),
//                 TextContent("value", "Lada Vesta SW Sport")
//               ]))
//           ])),
//       ]))
//       ..add(ListContent("multilineList", [
//         PlainContent("multilinePlain")
//           ..add(TextContent('multilineText', 'line 1')),
//         PlainContent("multilinePlain")
//           ..add(TextContent('multilineText', 'line 2')),
//         PlainContent("multilinePlain")
//           ..add(TextContent('multilineText', 'line 3'))
//       ]))
//       ..add(TextContent('multilineText2', 'line 1\nline 2\n line 3'))
//       ..add(ImageContent('img', testFileContent));
//
//     final d = await docx.generate(c);
//     if (d != null) {
//       final outputDirectory = await getExternalStorageDirectory();
//       final outputFilePath = '${outputDirectory?.path}/generated.docx';
//       final outputFile = File(outputFilePath);
//       await outputFile.writeAsBytes(d);
//       print('Document generated and saved to $outputFilePath');
//     } else {
//       print('Failed to generate the document.');
//     }
//   }
//
// }
//
// Future<bool> requestStoragePermission() async {
//   if (await Permission.storage.isDenied == true) {
//     var permission = await Permission.storage.request();
//     if (permission.isGranted) {
//       print("granted");
//       return true;
//     } else {
//       // permission = await Permission.storage.request();
//       return false;
//     }
//   } else {
//     print('granted');
//     return true;
//   }
// }
//
// //  Future<void> modifyDocx() async {
// //     await requestStoragePermission();
// //     final downloadsDirectory =
// //     Directory((await getDownloadsDirectory())?.path ?? "");
// //
// //     // Download the DOCX file
// //     final docxBytes = await getDocType();
// //     if (docxBytes == null) {
// //       print('Failed to download DOCX file.');
// //       return;
// //     }
// //
// //     // Load the DOCX file into DocxTemplate
// //     final docxTemplate = await DocxTemplate.fromBytes(docxBytes);
// //   Content c = Content();
// //   c.add(TextContent("doc_body", colorHtml));
// //
// //   final docGenerated = await docxTemplate.generate(c);
// //
// //   if (docGenerated == null) {
// //   print('Failed to generate the document.');
// //   return;
// //   }
// //
// //   // Save the modified document
// //   final outputFile = File('${downloadsDirectory.path}/ModifiedDocument.docx');
// //   await outputFile.writeAsBytes(docGenerated);
// //
// //   print('Document modified and saved successfully.');
// // }
// //
// // Future<Uint8List?> getDocType() async {
// //   try {
// //     final response = await http.get(
// //         Uri.parse('https://uatapi.dealdox.io/api/doctype/get'),
// //         headers: {
// //           "Content-Type": "application/json",
// //           "Authorization": "Bearer your_token_here"
// //         });
// //
// //     if (response.statusCode == 200) {
// //       var data = jsonDecode(response.body);
// //       String url = (data['data']
// //           .where((e) => e['doc_name'] == "Dasspass_ Quotation")
// //           .toList())[0]['template_file'] ??
// //           "";
// //       return await downloadFile(url);
// //     }
// //   } catch (e, stackTrace) {
// //     log("Following Exception was thrown while fetching doc type: $e",
// //         stackTrace: stackTrace);
// //   }
// //   return null;
// // }
// //
// // Future<Uint8List?> downloadFile(String url) async {
// //   try {
// //     final response = await http.get(Uri.parse(url));
// //     if (response.statusCode == 200) {
// //       return response.bodyBytes;
// //     } else {
// //       print('Failed to download file. Status code: ${response.statusCode}');
// //     }
// //   } catch (e) {
// //     log(e.toString());
// //   }
// //   return null;
// // }
