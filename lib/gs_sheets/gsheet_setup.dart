import "dart:convert";
import "dart:math";
import "package:flutter/material.dart";
import "package:gsheets/gsheets.dart";
import "crud_google_sheets/gsheets_operations.dart";
import 'package:http/http.dart' as http;
import 'dart:developer' as dev;
// import 'package:googleapis/sheets/v4.dart';

//plugin-testing@gsheets-427513.iam.gserviceaccount.com
var sheetId = "1JlK0czrggsqqS-D8yM3i9FaIz8vJwLr63PUOzYcv3pY";

var credentials = r'''{
  "type": "service_account",
  "project_id": "gsheets-427513",
  "private_key_id": "44a993bf727ae8ce6a5b312b4524df674b971fb0",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQC+u0jBAKQWNFvw\nN10qiA44aneok0N7zuriagdkXYyZSMfhM8dU5nIak7JRGtWZcvbNL1Xt7XrLWlIK\nAQpsL+A0c4jrQqBzx+ZQbV0o7SB4oQYttf4I7bPZDEQ0suiiZ5Zh31aU/m864QJW\ngS/KKN9FkW6TTzLCmb+QkFS+cS140d4SFZUTOFaLDGcQ/SGUnSVghDtoaNxDENQ3\nVPNfMvqtIzXVbEw14haPxk7vkODq9B+9x0QTqvdiUtHL8kMYCgRGgt81V4supBAx\nf4Lopmkt2XsLZTKMzUofrkKqhholR9jKyUaot8yYxXfVroHMsskDmAtKufHCahSW\nvbqnkRS9AgMBAAECggEAVH+vh0YL7ARtWNqGTYHyXt8YPRhk9NRibkWQGdByKjS6\nzNQ+MqhXk9usS89KI03x9kxK0vp7hNzybJkyb2S0fThUR/oAENtWd3pEJA4N7TNV\ng+nVbko0++s5ymkatFyVHK4v8xlX2Ot3uDBKplL+O5lnNh8Hu3wXCOpQiQCmJxh6\naEFWnOQWrcmvLGufDo0BI5PivWcSAaOsNkUbRaOV/K6I0nKOBajBoY74WiJH4muz\n7bMkKmf4VDmiuKF+pXPGPKZhucg7IoefXqCOCWi5SNyAdUYMkjkeaKjXLUaN9EVC\noBTe7fvce52a9Q4gOiBT45ouDi5jo0q1+UozNc6U1wKBgQD050mf2JS1Pr3Mr8MQ\n2uwBrw95c/kFfVVrlYEmuNWw85zseld6UuZmAhVd0gR7o5KMofEf8/WqbGeY3Byb\nYOyiOP0DFI7/wSAWdaPB3Dur66CrQcCCbsREXEDnPakhLdZOvVXxJ2S/Wy5XuSB4\nWzZ+30l+gS7LcPAalBjqrdj+owKBgQDHX6PK9TdLNYL7OdIToiv7YXVWNjbObfgx\n8dFRKOugLIn7Gq2MxZ6pjekkj/C1I04jgLZX62LoPb9koc0nK9qVQR6XObSNd3ae\nVodR9BIWCYsIXnQsWiurCrTwrzf2gzbzWQNZE88hb7S4KTTl4Jf6xVv8Xm32V8TQ\nU9bC4cu1HwKBgQCjOQ9R0Mhz78gSBsaskiwfhyx6FvhOV1U6Kd91DlWl5QeeeH+b\nEGtsa1EQQawpN0CyKDCLyk3ecves4m7ShAvSpsbCac5Q2MdpEKi+yOigUZ+45E7I\n38hBg3biZ680ZNdjjT8dRdMY0k2Vu9XPQYOVlX3nKXQltTThkfj1WD66nwKBgQCF\nynV0/kdjzf4errd9+2b+Y3FFME5pCrzyby8jAo3UR+80Nbve6sLFT3jz0zAZrh6C\njp5Os6QE62Ljmfy8253saO2pV80E3fUY3kIiyeHVLgRB0nitRrllJ2My3LJ2V6lp\ndgNcJIHsEzU4HFbmKGh0nTpUSd4K4O0vTAOjdbioywKBgQCqu1QVRWNCmE7/o8A2\nHj6FK4tfQFaEOhYD45CUoOwES/WV1OEjNEWURdX+O03jJmPnmrjYYytbfk37apLa\nj7+p3IFvazwRFmS1bxDX7cUfDKTbavj3CTh3nEI+/nppWy9IoMzDKJenXIEFKBn3\nipUkerR3OEJKqCJ/vRZLJTT9IQ==\n-----END PRIVATE KEY-----\n",
  "client_email": "plugin-testing@gsheets-427513.iam.gserviceaccount.com",
  "client_id": "113825245635502730138",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/plugin-testing%40gsheets-427513.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}''';

final gsheetinit = GSheets(credentials);
var gSheetController;

Worksheet? gSheetCrudUserDetails;

GsheetInit()async{
  gSheetController = await gsheetinit.spreadsheet(sheetId);
  gSheetCrudUserDetails = await gSheetController.worksheetByTitle('gsheet_demo');
}

Future main()async{
    WidgetsFlutterBinding.ensureInitialized();
    await GsheetInit();
    runApp(const MyApp1());
}
class MyApp1 extends StatefulWidget {
  const MyApp1({super.key});

  @override
  State<MyApp1> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp1> {
  String? id;
  final textController  = TextEditingController();
  var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";

  Random random = Random();
  uniqueIdGenerator()async{
    Random random1 = Random();
    int randomNum = random.nextInt(100000);

    String getRandomString(int length)=>String.fromCharCodes(Iterable.generate(length,(_)=>chars.codeUnitAt(random.nextInt(chars.length))));
    id = "$randomNum${getRandomString(10)}";
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
                  const SizedBox(height:100),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)
                      )
                    ),
                    controller: textController,
                  ),
                  OutlinedButton.icon(onPressed: (){
                    uniqueIdGenerator();
                    List<Map<String,dynamic>> userDetailsList = [
                      {
                        "id":"$id",
                        "name":textController.text.isEmpty?"No name":textController.text
                      }
                    ];
                    insertDataIntoSheet(userDetailsList);
                    readDataFromSheet();
                  }, label: const Icon(Icons.send)),
                  const Spacer(),
                ],
              )
          )),
    );
  }
}




