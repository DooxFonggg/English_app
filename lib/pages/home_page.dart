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
  int _currentIndex = 0;
  PageController _pageController = PageController();
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
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },

                  // tạo ra kiểu lướt list
                  itemCount: 5, // số lần lướt
                  itemBuilder: (context, index) {
                    // index hiển thị số trang đã lướt đến
                    return Container(
                      decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            child: Image.asset(AppAssest.heart),
                            padding: EdgeInsets.all(16),
                          ),
                          RichText(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start, // dồn chữ về bên trái
                              text: TextSpan(
                                  text: 'B',
                                  style: TextStyle(
                                      fontFamily: FontFamily.sen,
                                      fontSize: 89,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        BoxShadow(
                                            color: Colors.black38,
                                            offset: Offset(3, 6)),
                                      ]),
                                  children: [
                                    TextSpan(
                                      text: 'eautiful',
                                      style: TextStyle(
                                          fontFamily: FontFamily.sen,
                                          fontSize: 56,
                                          fontWeight: FontWeight.bold,
                                          shadows: [
                                            BoxShadow(
                                                color: Colors.black38,
                                                offset: Offset(3, 6)),
                                          ]),
                                    ),
                                  ])),
                          Padding(
                            padding: const EdgeInsets.all(24),
                            child: Text(
                              '"Think of all the beauty still left around you and be happy."',
                              style: AppStyles.h4.copyWith(letterSpacing: 1),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: size.height * 1 / 14,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 24),
                alignment: Alignment.center,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return buidIndicator(index == _currentIndex, size);
                    }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //thuộc tính này thường được dùng làm nút góc phải điện thoại
        onPressed: () {},
        child: Image.asset(AppAssest.exchange),
        backgroundColor: AppColor.primaryColor,
      ),
    );
  }

  Widget buidIndicator(bool isActive, Size size) {
    return Container(
      height: 08,
      margin: EdgeInsets.symmetric(horizontal: 24),
      width: isActive ? size.width * 1 / 5 : 24,
      decoration: BoxDecoration(
          color: isActive ? AppColor.lightBlue : AppColor.lightGrey,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
                color: Colors.black38, offset: Offset(2, 3), blurRadius: 3)
          ]),
    );
  }
}
