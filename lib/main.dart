// import 'dart:io';
// import 'dart:typed_data';
// import 'dart:ui' as ui;
import 'dart:math';
import 'package:flutter/material.dart';
import 'gs_sheets/crud_google_sheets/gsheets_operations.dart';
// import 'package:flutter/rendering.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:pulgin_testing/flutter_javascript/example1.dart';
// import 'package:pulgin_testing/my_docx_template/doc_download_open/doc_download_open.dart';
//



void main() {
  runApp(const MyApp());
}
//
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? ID;
final textController  = TextEditingController();
var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";

Random random = Random();
  uniqueIdGenerator()async{
    Random random1 = Random();
    int randomNum = random.nextInt(100000);

    String getRandomString(int length)=>String.fromCharCodes(Iterable.generate(length,(_)=>chars.codeUnitAt(random.nextInt(chars.length))));
    ID = "$randomNum${getRandomString(10)}";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          body: Center(
            child:Column(
              children: [
                TextField(
                  controller: textController,
                ),
                OutlinedButton.icon(onPressed: (){
                  uniqueIdGenerator();
                  List<Map<String,dynamic>> userDetailsList = [
                    {
                      "id":"$ID",
                      "name":textController.text.isEmpty?"No name":textController.text
                    }
                  ];
                  insertDataIntoSheet(userDetailsList);
                }, label: const Icon(Icons.cable))
              ],
            )
          )),
    );
  }
}
//
// String colorHtml = """
//   <p style="text-align: justify;" id="isPasted">
//     <span style="font-family: 'Times New Roman', Times, serif;">
//         <span dir="ltr">
//             <span style="font-family: 'Times New Roman', Times, serif;">
//                 <strong>#{CALC_SHEET_TABLE(Rate,C17,G23,REMOVE_EMPTY_ROWS,REMOVE_EMPTY_COLUMNS )}#</strong>
//             </span>
//         </span>
//     </span>
// </p>
// <p style="text-align: justify;"><br></p>
// <table style="width: 100%; margin-left: calc(0%);">
//     <tbody>
//         <tr>
//             <td style="width: 99.9076%; background-color: rgb(253, 231, 103);" colspan="3">
//                 <div style="text-align: center;"><strong>COMMERCIAL TERMS AND CONDITION</strong></div>
//             </td>
//         </tr>
//         <tr>
//             <td style="width: 12.6364%; text-align: center;">1</td>
//             <td style="width: 32.7412%; text-align: center;">Price</td>
//             <td style="width: 54.5046%;">EX Work Bilaspur basis</td>
//         </tr>
//         <tr>
//             <td style="width: 12.6364%; text-align: center;">2</td>
//             <td style="width: 32.7412%; text-align: center;">Taxes and Duties</td>
//             <td style="width: 54.5046%;">GST-Extra as applicable at the time of dispatch, present rate is @18%</td>
//         </tr>
//         <tr>
//             <td style="width: 12.6364%; text-align: center;">3</td>
//             <td style="width: 32.7412%; text-align: center;">Other Duties</td>
//             <td style="width: 54.5046%;">Octroi/any other duty and leaves/ taxes etc. if imposed by Govt after the data of this offer will be to purchaser account</td>
//         </tr>
//         <tr>
//             <td style="width: 12.6364%; text-align: center;">4</td>
//             <td style="width: 32.7412%; text-align: center;">Packing and forwarding</td>
//             <td style="width: 54.5046%;">Inclusive Normal packing if wooden crate packing need, then it ill be charge extra</td>
//         </tr>
//         <tr>
//             <td style="width: 12.6364%; text-align: center;">5</td>
//             <td style="width: 32.7412%; text-align: center;">Freight</td>
//             <td style="width: 54.5046%;">inclusive</td>
//         </tr>
//         <tr>
//             <td style="width: 12.6364%; text-align: center;">6</td>
//             <td style="width: 32.7412%; text-align: center;">Transit Insurance</td>
//             <td style="width: 54.5046%;">Purchase Scope<br>Subject to &#39;Force Majeure&#39; Conditions which are beyond our control</td>
//         </tr>
//         <tr>
//             <td style="width: 12.6617%; text-align: center;" rowspan="5">7</td>
//             <td style="width: 32.7412%; text-align: center;" rowspan="5">Delivery</td>
//             <td style="width: 54.5046%;">Delivery priority of boards(to be released in Lots) shall be finalized during kick-off meeting</td>
//         </tr>
//         <tr>
//             <td style="width: 54.5046%;">We shall make submission of documents within 2 weeks of release of load data by purchaser from the date of release of load data of the respective boards bry purchaser</td>
//         </tr>
//         <tr>
//             <td style="width: 54.5046%;">A maximum &nbsp;of 8 to 10 weeks time shall be considered for dispatch after document approval in CAT -1 by purchaser</td>
//         </tr>
//         <tr>
//             <td style="width: 54.5046%;">d) Delay, If any in drawing/data approval from above schedule, then the delivery time shall be revised as mutually agreed at the time of manufacturing clarence</td>
//         </tr>
//         <tr>
//             <td style="width: 54.5046%;">Delivery Period is quoted in good faith, Seller is not liable for delay beyond control,Liquidated and consequential damages/LD is not applicable</td>
//         </tr>
//         <tr>
//             <td style="width: 12.6617%; text-align: center;">8</td>
//             <td style="width: 32.7412%; text-align: center;">Payments Terms</td>
//             <td style="width: 54.5046%;">30% Advance against P.O<br>10% Against drawing approval<br>Balance along with 100% taxes and duties against performa invoice after inspection prior to dispatch</td>
//         </tr>
//         <tr>
//             <td style="width: 12.6617%; text-align: center;">9</td>
//             <td style="width: 32.7412%; text-align: center;">Supervision of Erection, testing and commissioning</td>
//             <td style="width: 54.5046%;"><span style="color: rgb(226, 80, 65);">Extra @ Rs 1200/- per day absis plan To and FRO Charges ii AC Train fare/Air Fare and expenses towards Lodging, Boarding and local Convergence</span></td>
//         </tr>
//         <tr>
//             <td style="width: 12.6617%; text-align: center;">10</td>
//             <td style="width: 32.7412%; text-align: center;">Warranty</td>
//             <td style="width: 54.5046%;">All Pack carry a warranty, against manufacturing defects for a period of 12 months from date of commissioning of 18 months from date of dispatch, whichever is earlier</td>
//         </tr>
//         <tr>
//             <td style="width: 12.6617%; text-align: center;">11</td>
//             <td style="width: 32.7412%; text-align: center;">Validity of offer</td>
//             <td style="width: 54.5046%;">30 days from date of offer</td>
//         </tr>
//         <tr>
//             <td style="width: 12.6617%; text-align: center;">12</td>
//             <td style="width: 32.7412%; text-align: center;">Jurisdiction</td>
//             <td style="width: 54.5046%;">All dispatches fall under jurisdiction of courts in Gurgaon.</td>
//         </tr>
//     </tbody>
// </table>
// <p><br></p>
// <p style="text-align: justify;" id="isPasted">
//     <span style="font-family: 'Times New Roman', Times, serif;">
//         <span dir="ltr">
//             <span style="font-family: 'Times New Roman', Times, serif;">
//                 <strong>#{CALC_SHEET_TABLE(Rate,C17,G23,REMOVE_EMPTY_ROWS,REMOVE_EMPTY_COLUMNS )}#</strong>
//             </span>
//         </span>
//     </span>
// </p>
// <p style="text-align: justify;"><br></p>
//   """;
//
// class MyHomePage extends StatelessWidget {
//   final GlobalKey _repaintBoundaryKey = GlobalKey();
//
//   MyHomePage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('HTML to PDF Example'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             //https://cdn.filestackcontent.com/Qb091ukGQqa2hDfQQVPs //word
//             //https://cdn.filestackcontent.com/ATu6ExKvPTfOS49qFhs4vz/output=format:pdf/wCd4c02zSDOb4bKGuCiH  //pdf
//             downloadFile("https://cdn.filestackcontent.com/AFvdIKH7wSuuPCwp2jTIcz/output=format:pdf/wUDGP0SZRXiGPB3u4Wk6", "test.pdf");
//           },
//           child: const Text('Create PDF'),
//         ),
//       ),
//     );
//   }
//
//   Future<void> convertHTMLtoPDFWidget() async {
//     try {
//       // Capture the widget as an image
//       final pngBytesList = await _captureWidgetToImages();
//
//       // Create a PDF document
//       final pdf = pw.Document();
//       for (final pngBytes in pngBytesList) {
//         pdf.addPage(
//           pw.Page(
//             build: (pw.Context context) {
//               return pw.Center(
//                 child: pw.Image(
//                   pw.MemoryImage(pngBytes),
//                 ),
//               );
//             },
//           ),
//         );
//       }
//
//       // Save the PDF file
//       final output = await getTemporaryDirectory();
//       print(output);
//       final file = File("$output/example.pdf");
//       await file.writeAsBytes(await pdf.save());
//
//       // Optionally, print the PDF
//       // await Printing.layoutPdf(
//       //   onLayout: (PdfPageFormat format) async => pdf.save(),
//       // );
//
//       print("PDF Created successfully! $output");
//     } catch (e) {
//       print("Error: $e");
//     }
//   }
//
//   ///  Expanded(
// //               child: RepaintBoundary(
// //                 key: _repaintBoundaryKey,
// //                 child: ListView(
// //                   // crossAxisAlignment: CrossAxisAlignment.stretch,
// //                   children: [
// //                     HtmlWidget(
// //                       colorHtml,
// //                       textStyle: const TextStyle(fontSize: 12),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
//
//   Future<List<Uint8List>> _captureWidgetToImages() async {
//     List<Uint8List> pngBytesList = [];
//     RenderRepaintBoundary boundary = _repaintBoundaryKey.currentContext!
//         .findRenderObject() as RenderRepaintBoundary;
//
//     final double widgetHeight = boundary.size.height + 100;
//     final double widgetWidth = boundary.size.width;
//     const double pageHeight =
//         800; // PDF page height in pixels (11 inches at 72 dpi)
//     final int pageCount = (widgetHeight / pageHeight).ceil();
//
//     for (int i = 0; i < pageCount; i++) {
//       final pngBytes = await _captureSubBoundary(
//           boundary, i * pageHeight, pageHeight, widgetWidth);
//       pngBytesList.add(pngBytes);
//     }
//
//     return pngBytesList;
//   }
//
//   Future<Uint8List> _captureSubBoundary(RenderRepaintBoundary boundary,
//       double offsetY, double height, double width) async {
//     // final recorder = ui.PictureRecorder();
//     // final canvas = Canvas(recorder);
//     // final paint = Paint();
//     //
//     // final matrix = Matrix4.identity()
//     //   ..translate(0.0, -offsetY);
//     // canvas.save();
//     // canvas.transform(matrix.storage);
//     // boundary.paint(canvas, Offset.zero);
//     // canvas.restore();
//     //
//     // final picture = recorder.endRecording();
//     // final image = await picture.toImage(width.toInt(), height.toInt());
//     // final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
//     // return byteData!.buffer.asUint8List();
//     final image = await boundary.toImage(pixelRatio: 3.0);
//     final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
//     return byteData!.buffer.asUint8List();
//   }
//
//   Future<String?> getTemporaryDirectory() async {
//     final directory = await getDownloadsDirectory();
//     return directory?.path;
//   }
// }
//
// ///  Future<void> convertHTMLtoPDFWidget(GlobalKey repaintBoundaryKey) async {
// //     try {
// //       // Convert the widget to an image
// //       final pngBytes = await _capturePng(repaintBoundaryKey);
// //       // Create a PDF document
// //       final pdf = pw.Document();
// //       pdf.addPage(
// //         pw.Page(
// //           build: (pw.Context context) {
// //             return pw.Image(pw.MemoryImage(pngBytes,orientation: PdfImageOrientation.topLeft),width: 300,height: 900,dpi: 300);
// //           }
// //       )
// //       );
// //
// //       // Save the PDF file
// //       final output = (await getDownloadsDirectory())?.path??"";
// //       final file = File("$output/example.pdf");
// //       await file.writeAsBytes(await pdf.save());
// //
// //       // Optionally, print the PDF
// //       // await Printing.layoutPdf(
// //       //   onLayout: (PdfPageFormat format) async => pdf.save(),
// //       // );
// //
// //       print("PDF Created successfully! ${file.path}");
// //     } catch (e) {
// //       print("Error: $e");
// //     }
// //   }
// //
// //   Future<Uint8List> _capturePng(GlobalKey repaintBoundaryKey) async {
// //     try {
// //       RenderRepaintBoundary boundary = repaintBoundaryKey.currentContext!
// //           .findRenderObject() as RenderRepaintBoundary;
// //       ui.Image image = await boundary.toImage();
// //       ByteData? byteData =
// //           await image.toByteData(format: ui.ImageByteFormat.png);
// //       return byteData!.buffer.asUint8List();
// //     } catch (e) {
// //       print("Error capturing image: $e");
// //       rethrow;
// //     }
// //   }
