// ignore_for_file: public_member_api_docs, sort_constructors_first
class Category {
  int id;
  String cateName;
  int cateID;
  Category({
    required this.id,
    required this.cateName,
    required this.cateID,
  });
}

//1 là income, 2 là expense
List<Category> cates = [
  Category(id: 1, cateName: 'Ăn uống', cateID: 2),
  Category(id: 2, cateName: 'Chi tiêu hàng ngày', cateID: 2),
  Category(id: 3, cateName: 'Quần áo', cateID: 2),
  Category(id: 4, cateName: 'Mỹ phẩm', cateID: 2),
  Category(id: 5, cateName: 'Y tế', cateID: 2),
  Category(id: 6, cateName: 'Giáo dục', cateID: 2),
  Category(id: 7, cateName: 'Đi lại', cateID: 2),
  Category(id: 8, cateName: 'Tiền nhà', cateID: 2),
  Category(id: 1, cateName: 'Tiền lương', cateID: 1),
  Category(id: 2, cateName: 'Tiền phụ cấp', cateID: 1),
  Category(id: 3, cateName: 'Tiền thưởng', cateID: 1),
  Category(id: 4, cateName: 'Tiền giao lưu', cateID: 1),
];
