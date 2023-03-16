import 'package:gsheets/gsheets.dart';

class UserSheetApi {
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "flutter-gsheet-380815",
  "private_key_id": "ffbf239b5849903b0bd597f4e073a4b693491b56",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC1pgOdjwqxBofg\n8KccjNjq1+Dm6RKB8QzXh25Lsle6nYYNkLtdVRf1kQqeByhUObHy8/xnYuIDhC9s\nXi2D/t5NBAOHniTHSbb+3j9gWIaZgH8FmFsydRxAw1pDxBG2iY96osKQ7zpDL9RP\nOd2Fhdd2W2txxbdV+05xwTW/v0qNjC/CxCzqV6XEiPag/1MJmkO2+oYDT6F5Xnws\nSmNMI9oJ3cKt+tojP7UQv1jp2fImhp1ytfyFtjAdtcwAQSio/lXWnuqF05eFflCo\nEAzRlMh9eZ+ye+uXH6WUn2WCUirrSfOspxvj9Kr2Ur4zEy33JBW4Idg6Yb7MUQX0\n42NOF8PJAgMBAAECggEADX8r1pmpxDSFhResewkWFwD6U33u45vLBfqondQ/A30v\n2DMwUMOBV7wyq0JB41w0Fia90tq8i2FXerhWrm+SCevp7To5ZltaTv6pe9moCqDL\nD1neMNYVxtQdEVrwq/z1nbmZNlaoIBTeNBLLHGAw/bjWN2pm8GsPTZF7Eme+vNyV\nJLKw+LFAke8o95JgjlwXH0SpRf+tbXu3EfdMRdg+8INUPQbYujCYt8JoPm/ONXdA\nClFQp2zGQULLNhWNpXHWCRiHh7+6sgPo4majIhXVYzRwANDQ0I1zq2kUruUYU1e4\nPeTqyeOAIh0tznG7JqADKnOMzwQLNToFfh9cN2NzrwKBgQDby1A6nkpO/Q5WNElF\nx75Hm0Q6pRFnApM9D6zqqx/jpdrH6+pJD+YHgyqLjkeVryDHk4UzgNvo3PH45SbB\nR98okzQx8vu+QO0q/nXM8xbmx2sFaAsPJgQ5blb1JgbCiPNzk47a+LyC519Zv0Vs\nYyuYZ29Lbuvh0fG/vZcG1xiBtwKBgQDTkho/35WDZzUUM9zRJ6T4EVBvB6jLw9S0\n6pmEB5Utk+rBwEyQftEnKPOdqB05C3goEJb17eHkT3TPZ+xkHrlfNeBKvFyLL3Qo\nq0ihJGNcR/QzV1taLM1J4Tdf0+8hzy+lJ8fBi/hA/3OsLjj41sFGAuEdfwCCq9E9\nN/aSasPmfwKBgQCxLMI+jmy+IZVV/g32tx32oP2t/HP7woKoHSO5gzpQitjCgbS5\nMpyt/5jjKE0iJyrYVl1wd/ZNTxWrGiVUdrg3//l6LjGqWrIUD00saeRTIftuP0Fy\n86VCGmT0drPKSxVcXF0yvIFRUGt3cAzpY0O4NeDsQLzaqx8h/hVpSSiTHwKBgEeh\nxutrWubTkcAWUyQphQxMaGw/LqJW2nSqnXF7U8HLvAb/gazGky/sCJePbN18iaEf\nBM2dTgcL8+OpLvsy/9ZBmoATSE4DshN28q9Eb7O11PNxF0fvtU3XR/VU/zj2Og5z\n6okYR+RR2SsptzZhF60JmohvEJAtdjmA8iXeqhcnAoGAclV708Zp9cggn0FPxgSL\nKIMYcIVG8NAJp8qhLNsxh4h3GKGiypGvGCQNvaMh3TDfmhPwU1OrpE6sm2j3mUnU\ndRRSZBGvh/Omje37WXDdWBBsOTBF0UDG3XSL2OxI0tTs0AGpJJy7Eo3MC6EXID4j\nGeA2po/FFH4c+mzqrm+q8xg=\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@flutter-gsheet-380815.iam.gserviceaccount.com",
  "client_id": "115336756698444836376",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40flutter-gsheet-380815.iam.gserviceaccount.com"
}
''';

  static final _spreadsheetID = '19mDAbiiNKaM03OyMuznaWtYV3ZXLhtcDnflELBAWbcQ';

  static final _gsheets = GSheets(_credentials);
  static Worksheet? _sheet;

  static Future init() async {
    final spreadsheet = await _gsheets.spreadsheet(_spreadsheetID);
    _sheet = await _getWorkSheet(spreadsheet, title: 'sheet1');

    _sheet!.values.insertRow(1, ['Hello', 'World', 'Steven', 'SingSong']);
  }

  static Future<Worksheet> _getWorkSheet(Spreadsheet spreadsheet,
      {required String title}) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static add() {
    _sheet!.values.appendRow(['Hello', 'World', 'Steven', 'SingSong']);
    // _sheet!.values.insertRow(1, ['Hello', 'World', 'Steven', 'SingSong']);
  }
}
