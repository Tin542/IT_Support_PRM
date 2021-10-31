import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:it_support/firebase_database/database.dart';
import 'package:it_support/models/request.dart';
import 'package:it_support/screens/feedback_screen/feedback_screen.dart';
import 'package:it_support/screens/payment_screen/payment_screen.dart';
import 'package:it_support/screens/request_screen/it_request_detail_screen.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({Key? key}) : super(key: key);

  @override
  _listrequestState createState() => _listrequestState();
}

class _listrequestState extends State<RequestScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  String reqEmail = '';
  String reqProblem = '';
  String reqDescription = '';
  String reqDevice = '';
  String reqIdTeamView = '';
  String reqPassTeamView = '';
  String reqStatus = '';

  Widget _buildRequestItem({required Map request, required String? id}) {
    return GestureDetector(
      onTap: () {
        final requestDetail = Request.fromRTDB(request);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailRequestScreen(
              request: requestDetail,
              id: id,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(10),
        height: 210,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.devices_other_outlined,
                  color: Colors.red,
                  size: 20,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  request['device'],
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Icon(
                  Icons.report_problem,
                  color: Theme.of(context).primaryColor,
                  size: 20,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  request['problem'],
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Icon(
                  Icons.description_outlined,
                  color: Colors.purple,
                  size: 20,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  request['user_email'],
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.purple,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.paid,
                  color: Colors.yellow[900],
                  size: 20,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(request['price'],
                    style: TextStyle(color: Colors.yellow[900])),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text("Status: "),
                SizedBox(
                  width: 6,
                ),
                Text(
                  request['status'],
                  style: request['status'] == 'Hoàn thành'
                      ? TextStyle(
                          fontSize: 16,
                          color: Colors.green[300],
                          fontWeight: FontWeight.w600)
                      : TextStyle(
                          fontSize: 16,
                          color: Colors.amberAccent,
                          fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FeedbackScreen(id: id)),
                    );
                  },
                  child: request['status'] == "Hoàn thành"
                      ? Row(
                          children: const [
                            Icon(
                              Icons.rate_review,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(' Đánh giá',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600)),
                          ],
                        )
                      : Text(""),
                ),
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentScreen(
                          req: id,
                          txtPrice: request['price'],
                        ),
                      ),
                    );
                  },
                  child: request['status'] == "Chờ thanh toán"
                      ? Row(
                          children: const [
                            Icon(
                              Icons.payments,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              ' Thanh toán',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        )
                      : Text(""),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Danh sách yêu cầu'),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: reqRef.orderByChild("user_email").equalTo(user!.email),
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map request = snapshot.value;
            String? key = snapshot.key;
            return _buildRequestItem(request: request, id: key);
          },
        ),
      ),
    );
  }
}
