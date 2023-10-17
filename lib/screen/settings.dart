// ignore_for_file: prefer_const_constructors

import 'package:finance_app/component/btn/button_primary.dart';
import 'package:finance_app/component/setting/box_basic_setting.dart';
import 'package:finance_app/component/setting/box_setting.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/typo.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        backgroundColor: themeColor,
        title: Center(
          child: Text('Cá nhân', style: H5()),
        ),
      ),
      body: ListView(
        children: [
          //header
          Stack(
            // alignment: AlignmentDirectional.center,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16),
                child: CircleAvatar(
                  radius: 75,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: green,
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                left: size.width * .465,
                child: CircleAvatar(
                  backgroundColor: blue,
                  radius: 15,
                  child: Icon(
                    Icons.camera_alt_outlined,
                    size: 15,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          //cài đặt cá nhân
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                BoxSetting(
                  title: 'Địa chỉ email',
                  text: 'Cuongnguyen.01hd@gmail.com',
                  onTap: () {},
                ),
                BoxSetting(
                  title: 'Name',
                  text: 'Nguyễn Mạnh Cường',
                  onTap: () {},
                ),
              ],
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
                Text('Cài đặt cơ bản', style: mediumBold()),
                SizedBox(height: 10),
                BoxBasicSetting(
                  text: 'Quản lý danh mục',
                  onTap: () {},
                ),
                BoxBasicSetting(
                  text: 'Chủ đề',
                  onTap: () {},
                ),
                BoxBasicSetting(
                  text: 'Thay đổi ngôn ngữ',
                  onTap: () {},
                ),
                BoxBasicSetting(
                  text: 'Thông tin ứng dụng',
                  onTap: () {},
                ),
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
