class Finance {
  String categoryName;
  String cost;
  String date;
  String note;
  bool cate;

  Finance({
    required this.categoryName,
    required this.cost,
    required this.date,
    required this.note,
    this.cate = true, //true là income, false là expense
  });
}

List<Finance> finances = [
  Finance(
    categoryName: 'Tiền phụ cấp',
    cost: '4.000.000',
    date: '5/10/2023',
    note: 'Tiền phụ cấp tháng 11',
    cate: true,
  ),
  Finance(
    categoryName: 'Ăn uống',
    cost: '250.000',
    date: '6/10/2023',
    note: 'Đi chợ',
    cate: false,
  ),
  Finance(
    categoryName: 'Ăn uống',
    cost: '30.000',
    date: '8/10/2023',
    note: 'mua chè',
    cate: false,
  ),
  Finance(
    categoryName: 'Đi lại',
    cost: '100.000',
    date: '14/10/2023',
    note: 'Đổ xăng',
    cate: false,
  ),
  Finance(
    categoryName: 'Tiền phụ cấp',
    cost: '4.000.000',
    date: '5/10/2023',
    note: 'Tiền phụ cấp tháng 11',
    cate: true,
  ),
  Finance(
    categoryName: 'Ăn uống',
    cost: '250.000',
    date: '6/10/2023',
    note: 'Đi chợ',
    cate: false,
  ),
  Finance(
    categoryName: 'Ăn uống',
    cost: '30.000',
    date: '8/10/2023',
    note: 'mua chè',
    cate: false,
  ),
  Finance(
    categoryName: 'Đi lại',
    cost: '100.000',
    date: '14/10/2023',
    note: 'Đổ xăng',
    cate: false,
  ),
];
