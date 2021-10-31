import 'package:flutter/material.dart';
import 'package:it_support/models/request.dart';
import 'package:it_support/screens/call_screen/videocall_screen.dart';
import 'package:it_support/screens/payment_screen/payment_screen.dart';

import '../../constant.dart';

class DetailRequestScreen extends StatelessWidget {
  final String? id;
  final Request request;
  const DetailRequestScreen({Key? key, required this.request, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chi tiết yêu cầu")),
      body: SafeArea(
        child: SingleChildScrollView(
          // physics: ClampingScrollPhysics(),
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              TextFormField(
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Hệ điều hành",
                  ),
                  initialValue: request.category),
              const SizedBox(height: 30),
              TextFormField(
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Thiết bị",
                  ),
                  initialValue: request.device),
              const SizedBox(height: 30),
              // TextFormField(
              //     readOnly: true,
              //     decoration: const InputDecoration(
              //       border: OutlineInputBorder(),
              //       labelText: "ID teamView",
              //     ),
              //     initialValue: request.idTeamView),
              // SizedBox(height: 30),
              // TextFormField(
              //     readOnly: true,
              //     decoration: const InputDecoration(
              //       border: OutlineInputBorder(),
              //       labelText: "Password teamView",
              //     ),
              //     initialValue: request.passTeamView),
              // SizedBox(height: 30),
              TextFormField(
                readOnly: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Vấn đề",
                ),
                initialValue: request.problem,
              ),
              const SizedBox(height: 30),
              TextFormField(
                readOnly: true,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Chi tiết vấn đề",
                ),
                initialValue: request.description,
              ),
              const SizedBox(height: 30),
              TextFormField(
                readOnly: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Trạng thái",
                ),
                initialValue: request.status,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: request.status == "Đang xử lí"
                    ? FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CallScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "CALL VIDEO",
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                      )
                    : const Text(""),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: request.status == "Chờ thanh toán"
                    ? FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentScreen(
                                  req: id, txtPrice: request.price),
                            ),
                          );
                        },
                        child: const Text(
                          "THANH TOÁN",
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                      )
                    : const Text(""),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
