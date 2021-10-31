import 'package:flutter/material.dart';
import 'package:flutter_braintree/flutter_braintree.dart';

class PaymentScreen extends StatefulWidget {
  final String txtPrice;
  const PaymentScreen({
    Key? key,
    required this.txtPrice,
  }) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Pay"),
          onPressed: () async {
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
            }
          },
        ),
      ),
    );
  }
}
