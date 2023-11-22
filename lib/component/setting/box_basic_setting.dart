import 'package:flutter/material.dart';
import 'package:finance_app/source/typo.dart';

class BoxBasicSetting extends StatelessWidget {
  const BoxBasicSetting({
    Key? key,
    required this.text,
    this.onTap,
    required this.icon,
  }) : super(key: key);
  final String text;
  final void Function()? onTap;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                icon,
                const SizedBox(width: 10),
                Text(
                  text,
                  style: tStyle.mediumRegular(),
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
