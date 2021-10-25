import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:it_support/firebase_database/database.dart';
import 'package:it_support/screens/components/rounded_input_field.dart';
import 'package:it_support/screens/home_screen/backgound.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({
    Key? key,
    this.id,
  }) : super(key: key);
  final String? id;
  @override
  _FeedbackState createState() => _FeedbackState();
}

class _FeedbackState extends State<FeedbackScreen> {
  final TextEditingController FeddbackTextEditingController =
      TextEditingController();
  String star = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Rating"),
      ),
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                width: size.width * 0.8,
                color: Color(0xFFCFE9F1),
                // color: Colors.blueGrey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);

                          setState(() {
                            star = rating.toString();
                          });
                          print("star: " + star);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    RoundedInputField(
                      controller: FeddbackTextEditingController,
                      hintText: "đánh giá",
                      onChanged: (value) {
                        controller:
                        FeddbackTextEditingController;
                      },
                    ),
                    FlatButton(
                      onPressed: () {
                        // print("id: " + widget.id!);
                        // print("text: " + FeddbackTextEditingController.text);
                        // print("star: " + star);
                        reqRef.child(widget.id!).update({
                          'rating': star,
                          'feedback': FeddbackTextEditingController.text,
                        });
                      },
                      child: Text("GỬI ĐÁNH GIÁ"),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
