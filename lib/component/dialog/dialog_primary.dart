// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:finance_app/component/btn/button_primary.dart';

class DialogPrimary extends StatelessWidget {
  const DialogPrimary({
    Key? key,
    this.onTap,
    required this.content,
  }) : super(key: key);
  final void Function()? onTap;
  final String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      content: Text(
        content,
        textAlign: TextAlign.center,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: ButtonPrimary(
            textButton: 'Đồng ý',
            onTap: onTap,
          ),
        )
      ],
    );
  }
}
