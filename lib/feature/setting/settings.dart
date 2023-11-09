// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_app/component/btn/button_primary.dart';
import 'package:finance_app/component/form_field/input_default.dart';
import 'package:finance_app/component/setting/box_basic_setting.dart';
import 'package:finance_app/component/setting/box_setting.dart';
import 'package:finance_app/data/user_account.dart';
import 'package:finance_app/feature/login/login.dart';
import 'package:finance_app/feature/setting/change_password.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/typo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  void initState() {
    super.initState();
    getInfo();
  }

  User? user = FirebaseAuth.instance.currentUser;
  UsersAccount? usersAccount;
  void getInfo() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get()
        .then((value) {
      setState(() {
        usersAccount = UsersAccount.fromMap(value.data());
      });
    });
  }

  Future<void> pickImage() async {
    try {
      final XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
      );
      if (pickedFile != null) {
        List<int> imageBytes = await pickedFile.readAsBytes();
        String base64Image = base64.encode(imageBytes);
        setState(() {
          usersAccount?.avatar = base64Image;
          UsersAccount userAcc = UsersAccount(
            name: usersAccount?.name,
            userName: usersAccount?.userName,
            avatar: base64Image,
          );
          AddtoServer(userAcc);
        });
      }
    } catch (e) {}
  }

  void AddtoServer(UsersAccount userAcc) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .set(userAcc.toMap());
  }

  @override
  Widget build(BuildContext context) {
    final String avat = usersAccount?.avatar ?? '';
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        title: Center(
          child: Text('Cá nhân', style: tStyle.H5()),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 16),
          //header
          Stack(
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16),
                child: CircleAvatar(
                  radius: 75,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: avat.isEmpty
                        ? null
                        : MemoryImage(
                            base64.decode(usersAccount?.avatar ?? '')),
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                left: size.width * .465,
                child: InkWell(
                  onTap: () {
                    pickImage();
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColors.blue,
                    radius: 15,
                    child: Icon(
                      Icons.camera_alt_outlined,
                      size: 15,
                    ),
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
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                BoxSetting(
                  title: 'Địa chỉ email',
                  text: usersAccount?.userName ?? '',
                  onTap: () {},
                ),
                BoxSetting(
                  title: 'Tên',
                  text: usersAccount?.name ?? '',
                  onTap: onTapChangeName,
                ),
                BoxSetting(
                  title: 'Mật khẩu',
                  text: 'Thay đổi mật khẩu',
                  onTap: onTapChangePw,
                ),
              ],
            ),
          ),

          //Cài đặt cơ bản
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Text('Cài đặt cơ bản', style: tStyle.mediumBold()),
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
            child: ButtonPrimary(
              textButton: 'Đăng xuất',
              onTap: onTapLogout,
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  void onTapBack() {
    Navigator.pop(context);
  }

  void onTapLogout() {
    FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(
        context, LoginPage.routeName, (route) => false);
  }

  void onTapChangeName() {
    final nameController = TextEditingController()
      ..text = usersAccount?.name ?? '';
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: InputDefault(
            hintText: 'Tên',
            obscureText: false,
            controller: nameController,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: ButtonPrimary(
                textButton: 'Cập nhật',
                onTap: () {
                  setState(() {
                    usersAccount?.name = nameController.text;
                  });
                  UsersAccount userAcc = UsersAccount(
                    name: nameController.text,
                    userName: usersAccount?.userName,
                    avatar: usersAccount?.avatar,
                  );
                  AddtoServer(userAcc);
                  onTapBack();
                },
              ),
            )
          ],
        );
      },
    );
  }

  void onTapChangePw() {
    Navigator.pushNamed(context, ChangePassword.routeName);
  }
}
