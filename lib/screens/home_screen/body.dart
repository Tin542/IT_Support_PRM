import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:it_support/firebase_database/database.dart';
import 'package:it_support/screens/chatbot_screen/chatbot_screen.dart';
import 'package:it_support/screens/home_screen/backgound.dart';
import 'package:it_support/screens/components/rounded_input_field.dart';
import 'package:it_support/screens/request_screen/it_request_list_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEmail();
  }

  final TextEditingController ticketNameTextEditingController =
      TextEditingController();
  final TextEditingController descriptionTextEditingController =
      TextEditingController();
  final TextEditingController idTVTextEditingController =
      TextEditingController();
  final TextEditingController passTVTextEditingController =
      TextEditingController();
  final TextEditingController statusTextEditingController =
      TextEditingController();
  final TextEditingController deviceTextEditingController =
      TextEditingController();
  final User? user = FirebaseAuth.instance.currentUser;

  String displayEmail = '';

  void getEmail() {
    usersRef.child(user!.uid).child('email').onValue.listen((event) {
      // final data = new Map<String, dynamic>.from(event.snapshot.value);
      // final email = data['email'] as String;
      final String email = event.snapshot.value;
      setState(() {
        displayEmail = '$email';
        print(displayEmail);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              "assets/images/Banner.png",
              width: size.width * 0.8,
            ),
          ),
          SizedBox(height: size.height * 0.03),
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              width: size.width * 0.8,
              color: Color(0xFFCFE9F1),
              // color: Colors.blueGrey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RoundedInputField(
                    controller: deviceTextEditingController,
                    hintText: "Thiết bị",
                    onChanged: (value) {
                      controller:
                      deviceTextEditingController;
                    },
                  ),
                  RoundedInputField(
                    controller: ticketNameTextEditingController,
                    hintText: "Tên vấn đề",
                    onChanged: (value) {},
                  ),
                  RoundedInputField(
                    controller: descriptionTextEditingController,
                    hintText: "Chi tiết vấn đề",
                    onChanged: (value) {},
                  ),
                  RoundedInputField(
                    controller: idTVTextEditingController,
                    hintText: "ID teamView (nếu có)",
                    onChanged: (value) {},
                  ),
                  RoundedInputField(
                    controller: passTVTextEditingController,
                    hintText: "Pass teamView (nếu có)",
                    onChanged: (value) {},
                  ),
                  // RoundedInputField(
                  //     hintText: "Explan your problem by picture...",
                  //     onChanged: (value) {},
                  //     icon: Icons.drive_folder_upload),
                  FlatButton(
                    onPressed: () {
                      if (deviceTextEditingController.text.isEmpty) {
                        displayToastMessage(
                            "Vui lòng điền tên thiết bị", context);
                      } else if (ticketNameTextEditingController.text.isEmpty) {
                        displayToastMessage(
                            "Vui lòng điền vấn đề của bạn", context);
                      } else if (descriptionTextEditingController
                          .text.isEmpty) {
                        displayToastMessage(
                            "Vui lòng điền chi tiết về vấn đề của bạn",
                            context);
                      } else {
                        reqRef.push().set({
                          'device': deviceTextEditingController.text,
                          'problem': ticketNameTextEditingController.text,
                          'description': descriptionTextEditingController.text,
                          'id_teamView': idTVTextEditingController.text,
                          'pass_TeamView': passTVTextEditingController.text,
                          'status': 'đang chờ xử lí',
                          'user_email': displayEmail,
                          'rating': '',
                          'feedback': '',
                        });

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    goToListRequest(context)));
                      }
                    },
                    child: Text(
                      "SUBMIT",
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  displayToastMessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }

  Widget goToListRequest(BuildContext context) {
    return RequestScreen();
  }
}
