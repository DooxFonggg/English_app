import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_quizz_app/models/english_today.dart';
import 'package:flutter_quizz_app/packages/quote/qoute_model.dart';
import 'package:flutter_quizz_app/packages/quote/quote.dart';
import 'package:flutter_quizz_app/values/app_assets.dart';
import 'package:flutter_quizz_app/values/app_colors.dart';
import 'package:flutter_quizz_app/values/app_styles.dart';
import 'package:english_words/english_words.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  late PageController _pageController;
  // khoi tao list danh sach tu moi
  List<englishToday> words = [];
  String quote = Quotes().getRandom().content!;
  // hàm ramdom ra các từ
  List<int> fixedListRamdom({int len = 1, int max = 120, int min = 1}) {
    if (len > max || len < min) {
      return [];
    }
    List<int> newList = [];

    Random random = Random();
    int count = 1;
    while (count <= len) {
      int val = random.nextInt(max);
      if (newList.contains(val)) {
        continue;
      } else {
        newList.add(val);
        count++;
      }
    }
    return newList;
  }

  getEnglishToday() {
    List<String> newList = [];
    List<int> rans = fixedListRamdom(len: 5, max: nouns.length);
    rans.forEach((index) {
      newList.add(nouns[index]);
    });

    words = newList.map((e) => getQuote(e)).toList();
  }

  englishToday getQuote(String noun) {
    Quote? quote = Quotes().getByWord(noun);
    return englishToday(
      noun: noun,
      quote: quote?.content,
      id: quote?.id,
    );
  }

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.9);
    // TODO: implement initState
    super.initState();
    getEnglishToday();
  }

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
        // margin: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Container(
              height: size.height * 1 / 10,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                // '"It is amazing how complete is the delusion that beauty is goodness."'
                '"$quote"',
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
                  itemCount: words.length, // số lần lướt
                  itemBuilder: (context, index) {
                    String firsLetter =
                        words[index].noun != null ? words[index].noun! : '';
                    firsLetter = firsLetter.substring(0, 1);

                    String leftLettter =
                        words[index].noun != null ? words[index].noun! : '';
                    leftLettter = leftLettter.substring(1, leftLettter.length);

                    String quoteDefault =
                        "Think of all the beauty still left around you and be happy";

                    String qoute = words[index].quote != null
                        ? words[index].quote!
                        : quoteDefault;
                    print(qoute);
                    // index hiển thị số trang đã lướt đến
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(3, 6),
                                  blurRadius: 6)
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(24))),
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
                                textAlign:
                                    TextAlign.start, // dồn chữ về bên trái
                                text: TextSpan(
                                    text: firsLetter,
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
                                        text: leftLettter,
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
                                '"$qoute"',
                                style: AppStyles.h4.copyWith(
                                    letterSpacing: 1,
                                    color: AppColor.textColor),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                height: size.height * 1 / 14,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  alignment: Alignment.center,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return buidIndicator(index == _currentIndex, size);
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //thuộc tính này thường được dùng làm nút góc phải điện thoại
        onPressed: () {
          setState(() {
            getEnglishToday();
          });
        },
        child: Image.asset(AppAssest.exchange),
        backgroundColor: AppColor.primaryColor,
      ),
    );
  }

  Widget buidIndicator(bool isActive, Size size) {
    return Container(
      height: 08,
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: isActive ? size.width * 1 / 5 : 24,
      decoration: BoxDecoration(
          color: isActive ? AppColor.lightBlue : AppColor.lightGrey,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
                color: Colors.black38, offset: Offset(2, 3), blurRadius: 6),
          ]),
    );
  }
}
