import 'package:finance_app/source/typo.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({
    Key? key,
    required this.hintText,
  }) : super(key: key);
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: tStyle.medium(),
      decoration: InputDecoration(
        fillColor: Colors.white.withAlpha(95),
        filled: true,
        hintText: hintText,
        suffixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 16,
        ),
      ),
    );
  }
}
