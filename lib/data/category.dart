import 'dart:convert';

class Category {
  String id;
  String cateName;
  String name;
  int cateID;
  int color;
  String icon;
  Category({
    required this.id,
    required this.cateName,
    required this.name,
    required this.cateID,
    required this.color,
    required this.icon,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'cateName': cateName,
      'name': name,
      'cateID': cateID,
      'color': color,
      'icon': icon,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as String,
      cateName: map['cateName'] as String,
      name: map['name'] as String,
      cateID: map['cateID'] as int,
      color: map['color'] as int,
      icon: map['icon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Category(id: $id,cateName: $cateName,name: $name,cateID: $cateID)';
  }
}
