import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Category {
  String id;
  String cateName;
  String name;
  int cateID;
  Category({
    required this.id,
    required this.cateName,
    required this.name,
    required this.cateID,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'cateName': cateName,
      'name': name,
      'cateID': cateID,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as String,
      cateName: map['cateName'] as String,
      name: map['name'] as String,
      cateID: map['cateID'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);
}

List<Category> cates = [
  Category(id: "", cateName: "Khoản chi", name: 'Ăn uống', cateID: 2),
  Category(
      id: "", cateName: "Khoản chi", name: 'Chi tiêu hàng ngày', cateID: 2),
  Category(id: "", cateName: "Khoản chi", name: 'Quần áo', cateID: 2),
  Category(id: "", cateName: "Khoản chi", name: 'Mỹ phẩm', cateID: 2),
  Category(id: "", cateName: "Khoản chi", name: 'Y tế', cateID: 2),
  Category(id: "", cateName: "Khoản chi", name: 'Giáo dục', cateID: 2),
  Category(id: "", cateName: "Khoản chi", name: 'Đi lại', cateID: 2),
  Category(id: "", cateName: "Khoản thu", name: 'Tiền lương', cateID: 1),
  Category(id: "", cateName: "Khoản thu", name: 'Tiền phụ cấp', cateID: 1),
  Category(id: "", cateName: "Khoản thu", name: 'Tiền thưởng', cateID: 1),
];
