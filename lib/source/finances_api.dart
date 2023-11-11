import 'package:dio/dio.dart';
import 'package:finance_app/data/finance.dart';

class FinanceRepo {
  static Future<List<Finance>> getFinances(String uid) async {
    final dio = Dio();
    final Response response = await dio.get(
        'https://finance-478a7-default-rtdb.firebaseio.com/finance/$uid.json');

    if (response.data != null) {
      Map<String, dynamic> json = response.data;
      final List<Finance> financeList =
          json.values.map((e) => Finance.fromMap(e)).toList();
      return financeList;
    } else {
      return [];
    }
  }

  static Future<List<Finance>> deleteFinances(String uid, String key) async {
    final dio = Dio();
    final Response response = await dio.delete(
        'https://finance-478a7-default-rtdb.firebaseio.com/finance/$uid/$key.json');
    if (response.data != null) {
      Map<String, dynamic> json = response.data;
      final List<Finance> financeList =
          json.values.map((e) => Finance.fromMap(e)).toList();
      return financeList;
    } else {
      return [];
    }
  }
}
