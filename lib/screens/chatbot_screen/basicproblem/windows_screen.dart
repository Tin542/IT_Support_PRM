import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_support/constant.dart';
import 'package:it_support/screens/bottom_nav_bar_screen.dart';

class WindowsScreen extends StatelessWidget {

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
                                "HƯỚNG DẪN CÁCH KHỞI\nĐỘNG MÁY TÍNH NHANH HƠN",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: kTitleTextColor,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              // Text(
                              //   "Tác giả: haodng",
                              //   style: TextStyle(
                              //     color: kTitleTextColor.withOpacity(0.7),
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50,
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
                      Text('Vào Run bằng cách bấm phím Windows+R và gõ vào đó từ “msconfig” rồi bấm Enter.',
                        style: TextStyle(
                          height: 1.6,
                          color: kTitleTextColor.withOpacity(0.7),
                        ),
                      ),
                      Image.network('http://i1.taimienphi.vn/tmp/cf/aut/cach-khoi-dong-may-tinh-nhanh-hon-1.jpg'),
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
                      Text('Sẽ xuất hiện bảng System Configuration Utility.',
                        style: TextStyle(
                          height: 1.6,
                          color: kTitleTextColor.withOpacity(0.7),
                        ),
                      ),
                      Image.network('https://imgt.taimienphi.vn/cf/Images/ntt/2014/8/cach-khoi-dong-may-tinh-nhanh-hon-2.jpg'),
                      SizedBox(
                        height: 20,
                      ),

                      Text(
                        'Bước 3:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: kTitleTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Trong bảng này bạn click sang Tab Statup. Trong này chứa các chương trình khởi động cùng máy tính bạn check bỏ vào trước  chương trình không cần thiết. (một số chương trình như phần mềm diệt virus bạn không nên check vì đó là chương trình bảo vệ).Sau đó bấm Apply để áp dụng thay đổi, bấm OK để thoát bảng.',
                        style: TextStyle(
                          height: 1.6,
                          color: kTitleTextColor.withOpacity(0.7),
                        ),
                      ),
                      Image.network('https://imgt.taimienphi.vn/cf/Images/ntt/2014/8/cach-khoi-dong-may-tinh-nhanh-hon-3.jpg'),
                      Text('Sau đó tiến hành khởi động lại máy tính là được.',
                        style: TextStyle(
                          height: 1.6,
                          color: kTitleTextColor.withOpacity(0.7),
                        ),
                      ),
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
