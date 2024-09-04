import 'package:pulgin_testing/gs_sheets/gsheet_setup.dart';

Future<void> insertDataIntoSheet(userDetailsList)async{
  bool isStored =  await gSheetCrudUserDetails!.values.map.appendRows(userDetailsList);
   print('Data Stored $isStored');
}

List<Map<String,dynamic>>? dataFromSheet = [];

readDataFromSheet()async{
  dataFromSheet = await gSheetCrudUserDetails!.values.map.allRows();
  print("data $dataFromSheet");
}