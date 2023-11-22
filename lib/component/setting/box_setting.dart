import 'package:flutter/material.dart';
import 'package:finance_app/source/typo.dart';

class BoxSetting extends StatelessWidget {
  const BoxSetting({
    Key? key,
    required this.title,
    required this.text,
    this.onTap,
    required this.icon,
  }) : super(key: key);
  final String title;
  final String text;
  final void Function()? onTap;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                icon,
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: tStyle.medium()),
                    const SizedBox(height: 5),
                    Text(
                      text,
                      style: tStyle.mediumRegular(),
                    ),
                  ],
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
