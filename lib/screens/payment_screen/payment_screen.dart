import 'package:flutter/material.dart';
import 'package:flutter_braintree/flutter_braintree.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:it_support/firebase_database/database.dart';

import 'package:it_support/screens/components/bottom_nav_bar.dart';

class PaymentScreen extends StatefulWidget {
  final String txtPrice;
  final String? req;
  const PaymentScreen({
    Key? key,
    required this.txtPrice,
    required this.req,
  }) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    payment();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  Future<void> payment() async {
    print("price: " + widget.txtPrice);
    var request = BraintreeDropInRequest(
        tokenizationKey: 'sandbox_rzfmsfvm_gsnpfscyym7sj4b4',
        collectDeviceData: true,
        paypalRequest: BraintreePayPalRequest(
            amount: widget.txtPrice, displayName: 'haoDng'),
        cardEnabled: true);
    BraintreeDropInResult? result =
        await BraintreeDropIn.start(request);
    if (result != null) {
      print(result.paymentMethodNonce.description);
      print(result.paymentMethodNonce.nonce);
      reqRef.child(widget.req!).update({'status': 'Hoàn thành'});

      displayToastMessage("Thanh toán thành công", context);

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => BottomNavBar()));
    } else {
      displayToastMessage("Thanh toán không thành công", context);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => BottomNavBar()));
    }
  }
}

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}
