import 'package:flutter/material.dart';
import 'package:flutter_quizz_app/values/app_assets.dart';
import 'package:flutter_quizz_app/values/app_colors.dart';
import 'package:flutter_quizz_app/values/app_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondColor,
      appBar: AppBar(
        backgroundColor: AppColor.secondColor,
        elevation: 0, // tắt đường line dưới
        leading: InkWell(
          onTap: () {},
          child: Image.asset(AppAssest.menu),
        ),
        title: Text(
          textAlign: TextAlign.center,
          'English today',
          style: AppStyles.h3.copyWith(color: AppColor.textColor, fontSize: 36),
        ),
        centerTitle: true, // Đảm bảo tiêu đề được căn giữa theo chiều ngang
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Image.asset(AppAssest.exchange),
        backgroundColor: AppColor.primaryColor,
      ),
    );
  }
}
