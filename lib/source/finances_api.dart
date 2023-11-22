import 'package:dio/dio.dart';
import 'package:finance_app/data/category.dart';
import 'package:finance_app/data/finance.dart';

class FinanceRepo {
  //finance
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

  static Future<List<Finance>> addFinances(
      String uid,
      int cateID,
      String cateName,
      int money,
      String dateTime,
      int color,
      String icon,
      String note) async {
    final dio = Dio();
    String url =
        'https://finance-478a7-default-rtdb.firebaseio.com/finance/$uid.json';
    Finance finance = Finance(
      id: '',
      cateID: cateID,
      cateName: cateName,
      money: money,
      dateTime: dateTime,
      note: note,
      icon: icon,
      color: color,
    );
    final Response response = await dio.post(url, data: finance.toMap());
    if (response.data != null) {
      String id = response.data['name'];
      String url1 =
          'https://finance-478a7-default-rtdb.firebaseio.com/finance/$uid/$id.json';
      await dio.patch(url1, data: {'id': id});
    }
    return [];
  }

  static Future<List<Finance>> deleteFinances(String uid, String key) async {
    final dio = Dio();
    await dio.delete(
        'https://finance-478a7-default-rtdb.firebaseio.com/finance/$uid/$key.json');
    return [];
  }

  static Future<List<Finance>> editFinances(
      String uid,
      String key,
      int cateID,
      String cateName,
      int money,
      String dateTime,
      int color,
      String icon,
      String note) async {
    final dio = Dio();
    String url =
        'https://finance-478a7-default-rtdb.firebaseio.com/finance/$uid/$key.json';
    Finance finance = Finance(
      id: key,
      cateID: cateID,
      cateName: cateName,
      money: money,
      dateTime: dateTime,
      note: note,
      icon: icon,
      color: color,
    );
    await dio.patch(url, data: finance.toMap());
    return [];
  }

  //categoryDefault
  static Future<List<Category>> getCateById(String uid) async {
    final dio = Dio();
    final Response response = await dio.get(
        'https://finance-478a7-default-rtdb.firebaseio.com/categoryById/$uid.json');

    if (response.data != null) {
      Map<String, dynamic> json = response.data;
      final List<Category> cateList =
          json.values.map((e) => Category.fromMap(e)).toList();
      return cateList;
    } else {
      return [];
    }
  }

  static Future<List<Finance>> addCateById(String uid, int cateID,
      String cateName, String nameCategory, int color, String icon) async {
    final dio = Dio();
    String url =
        'https://finance-478a7-default-rtdb.firebaseio.com/categoryById/$uid.json';
    Category cate = Category(
      id: '',
      cateID: cateID,
      cateName: cateName,
      name: nameCategory,
      icon: icon,
      color: color,
    );
    final Response response = await dio.post(url, data: cate.toMap());
    if (response.data != null) {
      String id = response.data['name'];
      String url1 =
          'https://finance-478a7-default-rtdb.firebaseio.com/categoryById/$uid/$id.json';
      await dio.patch(url1, data: {'id': id});
    }
    return [];
  }

  static Future<List<Finance>> updateCateById(String uid, String id, int cateID,
      String cateName, String nameCategory, int color, String icon) async {
    final dio = Dio();
    String url =
        'https://finance-478a7-default-rtdb.firebaseio.com/categoryById/$uid/$id.json';
    Category cate = Category(
      id: id,
      cateID: cateID,
      cateName: cateName,
      name: nameCategory,
      icon: icon,
      color: color,
    );
    dio.patch(url, data: cate.toMap());
    return [];
  }

  static Future<List<Finance>> deleteCate(String uid, String key) async {
    final dio = Dio();
    await dio.delete(
        'https://finance-478a7-default-rtdb.firebaseio.com/categoryById/$uid/$key.json');
    return [];
  }
}
