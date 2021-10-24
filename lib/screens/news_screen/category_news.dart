import 'package:flutter/material.dart';
import 'package:it_support/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class CategoryNews extends StatelessWidget {
  const CategoryNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
        title: Text("Tin Tức"),
        backgroundColor: kBlueColor
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 100,
                ),
                InkWell(
                  onTap: () async {
                    final url =
                        "https://tinhte.vn/thread/huong-dan-cap-nhat-len-windows-11-mien-phi-cach-ep-may-len-windows-11-ngay-hom-nay.3413014/";
                    if (await canLaunch(url)) {
                      await launch(url);
                    }
                  },
                  child: Stack(
                    children: <Widget>[
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          width: 325,
                          height: 200,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              'Cách cập nhật lên Windows 11',
                              style: TextStyle(
                                color: kTitleTextColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 40,
                        child: Container(
                          height: 200,
                          width: 250,
                          // decoration: BoxDecoration(
                          //   color: kBlueColor,
                          //   borderRadius: BorderRadius.circular(20),
                          // ),
                          child: Image.network(
                              'https://cdn.tgdd.vn/Files/2021/09/07/1380917/introwin11_1280x720-800-resize.jpg'),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),

                InkWell(
                  onTap: () async {
                    final url =
                        "https://tinhte.vn/thread/nhung-ly-do-ban-nen-len-windows-11.3409176/";
                    if (await canLaunch(url)) {
                      await launch(url);
                    }
                  },
                  child: Stack(
                    children: <Widget>[
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          width: 325,
                          height: 200,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              'Lý do bạn nên cập nhập lên Windows 11',
                              style: TextStyle(
                                color: kTitleTextColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 40,
                        child: Container(
                          height: 200,
                          width: 250,
                          // decoration: BoxDecoration(
                          //   color: kBlueColor,
                          //   borderRadius: BorderRadius.circular(20),
                          // ),
                          child: Image.network(
                              'https://3er1viui9wo30pkxh1v2nh4w-wpengine.netdna-ssl.com/wp-content/uploads/prod/sites/463/2021/06/Hero-Bloom-Logo-1000x563-1.jpg'),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),

                InkWell(
                  onTap: () async {
                    final url =
                        "https://tinhte.vn/thread/benchmark-gpu-32-nhan-m1-max-68870-diem-gap-3-lan-m1-va-radeon-pro-5300m.3421834/";
                    if (await canLaunch(url)) {
                      await launch(url);
                    }
                  },
                  child: Stack(
                    children: <Widget>[
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          width: 325,
                          height: 200,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              'Benchmark GPU 32 nhân M1 Max',
                              style: TextStyle(
                                color: kTitleTextColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 40,
                        child: Container(
                          height: 200,
                          width: 250,
                          // decoration: BoxDecoration(
                          //   color: kBlueColor,
                          //   borderRadius: BorderRadius.circular(20),
                          // ),
                          child: Image.network(
                              'https://genk.mediacdn.vn/139269124445442048/2021/10/20/1-16347181454341797149137.jpg'),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),

                InkWell(
                  onTap: () async {
                    final url =
                        "https://www.thegioididong.com/tin-tuc/cach-tat-hieu-ung-chuyen-canh-tren-windows-11-1391458";
                    if (await canLaunch(url)) {
                      await launch(url);
                    }
                  },
                  child: Stack(
                    children: <Widget>[
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          width: 325,
                          height: 200,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              'Cách tắt hiệu ứng chuyển cảnh Windows 11',
                              style: TextStyle(
                                color: kTitleTextColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 40,
                        child: Container(
                          height: 200,
                          width: 250,
                          // decoration: BoxDecoration(
                          //   color: kBlueColor,
                          //   borderRadius: BorderRadius.circular(20),
                          // ),
                          child: Image.network(
                              'https://cdn.tgdd.vn/Files/2021/10/18/1391458/huongdancachtathieuungchuyencanhtrenwindows111-_1366x768-800-resize.jpg'),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),

                InkWell(
                  onTap: () async {
                    final url =
                        "https://tinhte.vn/thread/huong-dan-cai-dat-ung-dung-android-len-windows-11-beta-moi-nhat.3421780/";
                    if (await canLaunch(url)) {
                      await launch(url);
                    }
                  },
                  child: Stack(
                    children: <Widget>[
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          width: 325,
                          height: 200,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              'Cách cài ứng dụng Android trên Windows 11',
                              style: TextStyle(
                                color: kTitleTextColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 40,
                        child: Container(
                          height: 200,
                          width: 250,
                          // decoration: BoxDecoration(
                          //   color: kBlueColor,
                          //   borderRadius: BorderRadius.circular(20),
                          // ),
                          child: Image.network(
                              'https://photo-cms-viettimes.zadn.vn/666x374/Uploaded/2021/bqmvlcvo/2021_06_25/cdsac-8215.png'),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
