import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_support/constant.dart';
import 'package:it_support/screens/bottom_nav_bar_screen.dart';


class AndroidScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/technology.png'),
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.24,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          // Image.asset(
                          //   _imageUrl,
                          //   height: 120,
                          // ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "HƯỚNG DẪN KHÔI PHỤC\nDANH BẠ TRÊN ANDROID",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: kTitleTextColor,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Cách 1: Đồng bộ hóa danh bạ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: kTitleTextColor,
                        ),
                      ),
                      Text(
                        'Bước 1:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: kTitleTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Vào Cài đặt trên điện thoại, chọn mục Tài khoản.\nChọn tài khoản bạn muốn đồng bộ và chọn Đồng bộ hóa tài khoản.',
                        style: TextStyle(
                          height: 1.6,
                          color: kTitleTextColor.withOpacity(0.7),
                        ),
                      ),
                      Image.network('https://cdn.tgdd.vn/Files/2016/07/25/862675/danh-ba-1-_2216x1276-800-resize.jpg'),
                      SizedBox(
                        height: 20,
                      ),

                      Text(
                        'Bước 2:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: kTitleTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Tìm đến mục danh bạ và bật nó lên.',
                        style: TextStyle(
                          height: 1.6,
                          color: kTitleTextColor.withOpacity(0.7),
                        ),
                      ),
                      Image.network('https://cdn.tgdd.vn/Files/2016/07/25/862675/danh-ba-2-_2232x1000-800-resize.jpg'),
                      SizedBox(
                        height: 20,
                      ),

                      Text(
                        'Cách 2: Khôi phục danh bạ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: kTitleTextColor,
                        ),
                      ),
                      Text(
                        'Bước 1:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: kTitleTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Mở ứng dụng Danh bạ trên Android và chọn biểu tượng "ba gạch" trên góc trái màn hình.\nChọn vào mục Cài đặt.',
                        style: TextStyle(
                          height: 1.6,
                          color: kTitleTextColor.withOpacity(0.7),
                        ),
                      ),
                      Image.network('https://cdn.tgdd.vn/Files/2016/07/25/862675/danh-ba-3-_2192x1088-800-resize.jpg'),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Bước 2:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: kTitleTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Chọn Khôi phục, chọn tài khoản bạn đã đồng bộ danh bạ ở bước trên và đợi cho quá trình hoàn tất.',
                        style: TextStyle(
                          height: 1.6,
                          color: kTitleTextColor.withOpacity(0.7),
                        ),
                      ),
                      Image.network('https://cdn.tgdd.vn/Files/2016/07/25/862675/danh-ba-4-_2184x956-800-resize.jpg'),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(80, 20, 0, 0),
                        child: RaisedButton(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          onPressed: () => Get.to(() => BottomNavScreen(),
                              transition: Transition.rightToLeftWithFade,
                              duration: Duration(milliseconds: 600)),
                          child: Text(
                            "Cần hỗ trợ thêm",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
