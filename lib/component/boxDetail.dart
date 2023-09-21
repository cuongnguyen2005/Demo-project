import 'package:finance_app/colors.dart';
import 'package:flutter/material.dart';

class DetailBox extends StatelessWidget {
  const DetailBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: grey,
            width: 1,
          )),
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tiền phụ cấp',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    Icons.money,
                    color: black,
                    size: 13,
                  ),
                  SizedBox(width: 3),
                  Text(
                    '400.000',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.calculate,
                    color: black,
                    size: 13,
                  ),
                  SizedBox(width: 3),
                  Text(
                    '20-05-2023',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.message,
                    color: black,
                    size: 13,
                  ),
                  SizedBox(width: 3),
                  Text(
                    'Đi chợ',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  )
                ],
              ),
            ],
          ),
          Spacer(),
          Row(
            children: [
              IconButton(
                padding: EdgeInsets.all(0),
                onPressed: () {},
                icon: Icon(
                  Icons.pending_actions,
                  color: blue,
                  size: 15,
                ),
              ),
              IconButton(
                padding: EdgeInsets.all(0),
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: red,
                  size: 15,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
