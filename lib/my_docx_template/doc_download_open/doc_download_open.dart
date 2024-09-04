import 'dart:convert';
import 'dart:developer';
import 'dart:io';
// import 'package:libre_doc_converter/libre_doc_converter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

void openFile(String url,String fileName)async{
 var file = await downloadFile(url,fileName);
 if(file!=null){
   // var myFile = await docxToPdf(file);
   // convertDocxToPdf(file);
   //  await OpenFile.open(file.path);
 }
}

Future<String?> getDownloadPath() async =>
    (await getDownloadsDirectory())?.path ?? "";

Future<bool> requestStoragePermission() async {
  if (await Permission.storage.isDenied == true) {
    var permission = await Permission.storage.request();
    if (permission.isGranted) {
      return true;
    } else {
      // permission = await Permission.storage.request();
      return false;
    }
  }else{
    return true;
  }
}
Future<File?> downloadFile(String url,String name)async{
      try{
        if(await Permission.storage.isDenied) await requestStoragePermission();
        final filePath = await getDownloadPath();
        final file = File('$filePath/$name');
        final response = await http.get(
            Uri.parse(url),
          headers: {
            // 'Accept': 'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
          },
        );
        // final ref = file.openSync(
        //     mode: FileMode.write
        // );
        if(response.statusCode==200){
          print(name);
          print(file.path);
          var data = response.bodyBytes;
          print(data);
          await file.writeAsBytes(data);
          log("file stored in path: ${file.path}");
          return null;
        }
      }catch(e,stackTrace){
        log("",error: e,stackTrace: stackTrace);
        return null;
      }
}

// Future<File?> docxToPdf(File file)async{
//     final converter = LibreDocConverter(inputFile: file);
//     try{
//      var myFile =  await converter.toPdf();
//      return myFile;
//     }catch(e){
//       log("",error: e);
//     }
//     return null;
// }

// Future<void> convertDocxToPdf(File docxFile) async {
//   String base = "https://cdn.filestackcontent.com";
//   const uploadUrl = 'https://www.filestackapi.com/api/store/S3?key==ATu6ExKvPTfOS49qFhs4vz';
//   const convertUrl = 'https://cdn.filestackcontent.com/output=format:pdf/';
//
//   try {
//     // Step 1: Upload DOCX file to Filestack
//     final uploadRequest = http.MultipartRequest('POST', Uri.parse(uploadUrl));
//     uploadRequest.files.add(await http.MultipartFile.fromPath('fileUpload', docxFile.path));
//
//     final uploadResponse = await uploadRequest.send();
//
//     if (uploadResponse.statusCode == 200) {
//       print("file sent");
//       final responseData = await uploadResponse.stream.bytesToString();
//       print(responseData);
//       return;
//       final jsonResponse = jsonDecode(responseData);
//       final handle = jsonResponse['handle'];
//
//       // Step 2: Convert DOCX to PDF using Filestack's conversion endpoint
//       final convertResponse = await http.get(Uri.parse('$convertUrl$handle'));
//
//       if (convertResponse.statusCode == 200) {
//         final pdfFile = File('${(await getApplicationDocumentsDirectory()).path}/output.pdf');
//         pdfFile.writeAsBytesSync(convertResponse.bodyBytes);
//         print('PDF file saved at: ${pdfFile.path}');
//       } else {
//         print('Failed to convert DOCX to PDF');
//       }
//     } else {
//       print('Failed to upload DOCX file ${uploadResponse.statusCode}  -- ${uploadResponse.reasonPhrase}');
//     }
//   } catch (e,stackTrace) {
//     log('Error: $e',stackTrace: stackTrace);
//   }
// }