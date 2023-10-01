// ignore_for_file: prefer_const_constructors

import 'package:finance_app/component/button_primary.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/typo.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: themeColor,
        title: Text('Cá nhân', style: H5()),
      ),
      body: ListView(
        children: [
          //header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: themeColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: CircleAvatar(
                    // child: Image.asset(),
                    radius: 50,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Nguyễn Mạnh Cường',
                  style: H5(),
                )
              ],
            ),
          ),

          //cài đặt cá nhân
          Container(
            margin: EdgeInsets.only(right: 16, left: 16, top: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Địa chỉ email', style: medium()),
                      Text('cuongnguyen.01hd@mail.com', style: mediumBold()),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),

          //Cài đặt cơ bản
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Text('Cài đăt cơ bản', style: mediumBold()),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(
                        color: grey,
                        width: 1,
                      ),
                    )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Quản lý danh mục', style: mediumRegular()),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(
                        color: grey,
                        width: 1,
                      ),
                    )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Chủ đề', style: mediumRegular()),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(
                        color: grey,
                        width: 1,
                      ),
                    )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Thay đổi ngôn ngữ', style: mediumRegular()),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(
                        color: grey,
                        width: 1,
                      ),
                    )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Thông tin ứng dụng', style: mediumRegular()),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),

          //button đăng xuất
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ButtonPrimary(textButton: 'Đăng xuất'))
        ],
      ),
    );
  }
}
