import 'package:finance_app/component/btn/button_no_box.dart';
import 'package:finance_app/source/colors.dart';
import 'package:flutter/material.dart';

class BottomSheetButton extends StatelessWidget {
  const BottomSheetButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.white,
      padding: const EdgeInsets.all(16),
      child: ButtonNoBox(
        textButton: 'Quay về',
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
