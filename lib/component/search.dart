// ignore_for_file: prefer_const_constructors

import 'package:finance_app/colors.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: white),
      decoration: InputDecoration(
        fillColor: Colors.black12,
        filled: true,
        hintText: 'Tìm kiếm',
        suffixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(32),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 10,
        ),
      ),
    );
  }
}
