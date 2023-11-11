import 'package:dio/dio.dart';
import 'package:finance_app/data/finance.dart';
import 'package:firebase_database/firebase_database.dart';

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

  static Future<List<Finance>> addFinances(String uid, int cateID,
      String cateName, int money, String dateTime, String note) async {
    final dio = Dio();
    var url =
        'https://finance-478a7-default-rtdb.firebaseio.com/finance/$uid.json';
    String? financeId =
        FirebaseDatabase.instance.ref().child('finance').child(uid).push().key;
    Finance finance = Finance(
      id: financeId ?? '',
      cateID: cateID,
      cateName: cateName,
      money: money,
      dateTime: dateTime,
      note: note,
    );
    await dio.post(url, data: finance.toMap());
    return [];
  }

  static Future<List<Finance>> deleteFinances(String uid, String key) async {
    final dio = Dio();
    await dio.delete(
        'https://finance-478a7-default-rtdb.firebaseio.com/finance/$uid/$key.json');
    return [];
  }

  static Future<List<Finance>> editFinances(String uid, String key, int cateID,
      String cateName, int money, String dateTime, String note) async {
    final dio = Dio();
    var url =
        'https://finance-478a7-default-rtdb.firebaseio.com/finance/$uid/$key.json';
    Finance finance = Finance(
      id: key,
      cateID: cateID,
      cateName: cateName,
      money: money,
      dateTime: dateTime,
      note: note,
    );
    await dio.put(url, data: finance.toMap());
    return [];
  }
}
