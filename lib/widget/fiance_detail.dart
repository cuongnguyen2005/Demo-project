import 'package:finance_app/source/colors.dart';
import 'package:finance_app/data/finance.dart';
import 'package:finance_app/source/typo.dart';
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
          'Danh sách thu chi',
          style: Healing20B(),
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
                      Text(finances[index].categoryName,
                          style: TextDynamic16B(
                            color: finances[index].cate == true ? green : red,
                          )),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            Icons.money,
                            color: finances[index].cate == true ? green : red,
                            size: 13,
                          ),
                          SizedBox(width: 3),
                          Text(finances[index].cost,
                              style: TextDynamic14(
                                color:
                                    finances[index].cate == true ? green : red,
                              )),
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
                            style: Text14(),
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
                            style: Text14(),
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
