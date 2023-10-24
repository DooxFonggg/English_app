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
    Size size = MediaQuery.of(context).size; // lay size ra
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
      body: Container(
        width: double.infinity, // chiều rộng tối đa có thể
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Container(
              height: size.height * 1 / 10,
              alignment: Alignment.center,
              child: Text(
                '"It is amazing how complete is the delusion that beauty is goodness."',
                style: AppStyles.h6
                    .copyWith(fontSize: 12, color: AppColor.textColor),
              ),
            ),
            Container(
              height: size.height * 2 / 3,
              child: PageView.builder(
                  // tạo ra kiểu lướt list
                  itemCount: 5, // số lần lướt
                  itemBuilder: (context, index) {
                    // index hiển thị số trang đã lướt đến
                    return Container(
                      decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Image.asset(AppAssest.exchange),
        backgroundColor: AppColor.primaryColor,
      ),
    );
  }
}
