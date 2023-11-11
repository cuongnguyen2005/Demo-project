import 'package:finance_app/data/finance.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

List<Finance> financeList = [];

class FirebaseFuntion {
  static Future<List<Finance>> getFinance(User? user) async {
    await FirebaseDatabase.instance
        .ref()
        .child('finance/${user!.uid}')
        .get()
        .then(
      (snap) {
        var map =
            Map<Object?, dynamic>.from(snap.value as Map<Object?, dynamic>);
        map.forEach(
          (key, value) {
            Finance? finance;
            finance = Finance.fromMap(value);
            financeList.add(finance);
          },
        );
      },
    );
    // print(financeList);
    return financeList;
  }

  //thêm mới thu chi
  static void addFinance(User? user, int cateID, String cateName, int money,
      String dateTime, String note) async {
    if (user != null) {
      String? financeId = FirebaseDatabase.instance
          .ref()
          .child('finance')
          .child(user.uid)
          .push()
          .key;
      Finance finance = Finance(
        cateID: cateID,
        cateName: cateName,
        money: money,
        dateTime: dateTime,
        note: note,
      );
      await FirebaseDatabase.instance
          .ref()
          .child('finance')
          .child(user.uid)
          .child(financeId!)
          .set(finance.toMap());
    }
  }

  //update thu chi
  static void updateFinance(User? user, String? key, int cateID,
      String cateName, int money, String dateTime, String note) async {
    if (user != null) {
      Finance finance = Finance(
        cateID: cateID,
        cateName: cateName,
        money: money,
        dateTime: dateTime,
        note: note,
      );
      await FirebaseDatabase.instance
          .ref()
          .child('finance')
          .child(user.uid)
          .child(key!)
          .set(finance.toMap());
    }
  }
}
