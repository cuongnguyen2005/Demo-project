import 'package:finance_app/colors.dart';
import 'package:finance_app/data/finance.dart';
import 'package:finance_app/widget/fix_detail.dart';
import 'package:flutter/material.dart';

class FianceDetail extends StatelessWidget {
  const FianceDetail({super.key});

  static String routeName = '/fiance_detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: maincolor,
        title: Text(
          textAlign: TextAlign.center,
          'Danh sách chi tiêu thu chi',
          style: TextStyle(
            color: black,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
            color: white, borderRadius: BorderRadius.circular(16)),
        child: ListView.builder(
          itemCount: finances.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: grey,
                    width: 1,
                  )),
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        finances[index].categoryName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: finances[index].cate == true ? green : red,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            Icons.money,
                            color: finances[index].cate == true ? green : red,
                            size: 13,
                          ),
                          SizedBox(width: 3),
                          Text(
                            finances[index].cost,
                            style: TextStyle(
                              fontSize: 13,
                              color: finances[index].cate == true ? green : red,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            Icons.calculate,
                            color: black,
                            size: 13,
                          ),
                          SizedBox(width: 3),
                          Text(
                            finances[index].date,
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
                            finances[index].note,
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, FixDetail.routeName,
                              arguments: finances[index].categoryName);
                        },
                        child: Icon(
                          Icons.pending_actions,
                          color: blue,
                          size: 15,
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
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
          },
        ),
      ),
    );
  }
}
