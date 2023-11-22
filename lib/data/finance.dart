import 'dart:convert';

class Finance {
  String id;
  int cateID;
  String cateName;
  int money;
  String dateTime;
  String note;
  int color;
  String icon;
  Finance({
    required this.id,
    required this.cateID,
    required this.cateName,
    required this.money,
    required this.dateTime,
    required this.note,
    required this.color,
    required this.icon,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'cateID': cateID,
      'cateName': cateName,
      'money': money,
      'dateTime': dateTime,
      'note': note,
      'color': color,
      'icon': icon,
    };
  }

  factory Finance.fromMap(Map<String, dynamic> map) {
    return Finance(
      id: map['id'] as String,
      cateID: map['cateID'] as int,
      cateName: map['cateName'] as String,
      money: map['money'] as int,
      dateTime: map['dateTime'] as String,
      note: map['note'] as String,
      color: map['color'] as int,
      icon: map['icon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Finance.fromJson(String source) =>
      Finance.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Finance(cateID: $cateID,cateName: $cateName,dateTime: $dateTime,money: $money)';
  }
}
